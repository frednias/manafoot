<?php

namespace Manafoot\ComponentBundle\Fifa\Uefa;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Competition\Instance;
use \Manafoot\ComponentBundle\Match;
use \Manafoot\ComponentBundle\Flash;
use \Manafoot\ComponentBundle\Championship;
use \Manafoot\ComponentBundle\Cup;
use \Manafoot\ComponentBundle\Team;
use \Manafoot\ComponentBundle\Utils\Range;
use \Manafoot\ComponentBundle\Fifa;
use \Manafoot\ComponentBundle\Utils;


class EuropeanChampionship {

    const CPT_ID = 9;

    // Starting World Cup Qualifications
    // Enters all Afc national team = X {52)
    // exclude world wup host team

    public function start (Game $game, Event $event) {
        $HOST_COUNTRY = array(
            2012 => array('tea_id'=>[90,102], 'host_name'=>'Pologne/Ukraine'),
            2016 => array('tea_id'=>[71], 'host_name'=>'France'),
        );
        $this->setupEnv($game,$event);
        $hostTeamId = implode(',', $HOST_COUNTRY[$this->evt_params->year]['tea_id']);
        $schema = $this->schema;
        $au = new Range;
        $ch = new Championship;

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(self::CPT_ID);
        $data = json_encode(array(
            'year' => $this->evt_params->year,
            'host_tea_id' => $HOST_COUNTRY[$this->evt_params->year]['tea_id'],
        ));
        $cpi = $comp->makeInstance($this->evt_params->year,$data);

        //$d->modify("+1 days");
        $d = new \DateTime($event->getDate());
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.ChampionshipQualification.start');
        $e->setVisibility('foreground');
        $e->setDescr("Tirage au sort du tour preliminaire du Championnat d'Europe ".$this->evt_params->year);
        $e->setStatus('todo');
        $e->setParams(json_encode(array(
            'year' => $this->evt_params->year,
            'host_tea_id' => $HOST_COUNTRY[$this->evt_params->year]['tea_id'],
            'master_cpi_id' => $cpi->getId(),
        )));
        $e->save();

        $d->modify('+485 days');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.drawround1');
        $e->setVisibility('foreground');
        $e->setDescr("Tirage au sort du 1er tour du Championnat d'Europe ".$this->evt_params->year);
        $e->setStatus('todo');
        $e->setParams(json_encode(array(
            'year' => $this->evt_params->year,
            'host_tea_id' => $HOST_COUNTRY[$this->evt_params->year]['tea_id'],
            'cpi_id' => $cpi->getId(),
        )));
        $e->save();
    }

    private $db;
    private $schema;
    private $evt_params;
    private $cpi;
    private $cpi_data;
    public function setupEnv($game,$event) {
        $this->db = new Database;
        $this->schema = $game->getName();
        $this->evt_params = json_decode($event->getParams());
        $this->cpi = new Competition\Instance($this->schema);
        if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }
    public function addQualifiedTeams ($schema, $cpi_id, $ass_id, $teams) {
        $cpi = new Competition\Instance($schema);
        $cpi->get($cpi_id);
        $data = json_decode($cpi->getData());
        $col = "qualified_$ass_id";
        $haveTeams = is_array($data->$col) ? $data->$col : [] ;
        $haveTeams = array_merge($haveTeams,$teams);
        $data->$col = $haveTeams;
        $cpi->setData(json_encode($data));
        $cpi->save();
    }

    public function drawround1($game, $event) {
        $this->setupEnv($game,$event);
        $r = new Utils\Range;
        $ch = new Championship;
        $elo = new Fifa\Elo;
        $hostTeaId = $this->evt_params->host_tea_id;
        $pot1 = $hostTeaId;
        $quals = $elo->sortTeam($this->schema, $this->cpi_data->qualified_11);
        $pot1 = array_merge($pot1, $r->subRange($quals,0,1));
        $pot2 = $r->subRange($quals,2,5);
        $pot3 = $r->subRange($quals,6,9);
        $pot4 = $r->subRange($quals,10,13);
        shuffle($pot2);
        shuffle($pot3);
        shuffle($pot4);
        $schedule = [0];

        $d = new \DateTime($event->getDate()); // 2011-11-17
        $precDate = '2011-11-17';
        $scheduleDate = ['2012-06-08', '2012-06-12', '2012-06-16'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }
        for ($i=1; $i<=4; $i++) {
            $gr = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
            $ch->roundRobin($this->schema, $gr, $this->cpi, $schedule, "1g$i.", false);
        }

        $d->modify('+1 days');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.round1');
        $e->setVisibility('foreground');
        $e->setDescr("1er tour du Championnat d'Europe ".$this->evt_params->year);
        $e->setStatus('todo');
        $e->setParams(json_encode(array(
            'year' => $this->evt_params->year,
            'host_tea_id' => $HOST_COUNTRY[$this->evt_params->year]['tea_id'],
            'cpi_id' => $this->cpi->getId(),
        )));
        $e->save();
    }

    public function round1($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;
        $ch = new Championship;
        $ranks = [];

        for ($i=1; $i<=4; $i++) {
            $rank = $ch->getRank($this->schema, $this->cpi->getId(), "1g$i%");
            $ranks[] = $rank;
        }

        $d = new \DateTime($event->getDate()); // 2012-06-17
        $d->modify('+4 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.1',$ranks[0][0]['tea_id'], $ranks[1][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.2',$ranks[1][0]['tea_id'], $ranks[0][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.3',$ranks[2][0]['tea_id'], $ranks[3][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.4',$ranks[3][0]['tea_id'], $ranks[2][1]['tea_id'], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.cup4');
        $e->setVisibility('foreground');
        $e->setDescr("Quarts de finale de l'Euro ");
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function cup4($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '2.');

        $d = new \DateTime($event->getDate()); // 2012-06-25
        $d->modify('+2 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.1',$quals[0], $quals[1], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.2',$quals[2], $quals[3], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.cup2');
        $e->setVisibility('foreground');
        $e->setDescr("Demi-finales de l'Euro");
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }
    public function cup2($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '3.');

        $d = new \DateTime($event->getDate()); // 2012-06-29
        $d->modify('+2 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'4.1',$quals[0], $quals[1], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.end');
        $e->setVisibility('foreground');
        $e->setDescr("Finale de l'Euro ".$this->cpi_data->year);
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function end($game,$event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '4.');

        $team = new Team;
        $team->get($quals[0]);

        $year = 2 + $this->cpi_data->year;
        $edition = 4 + $this->cpi_data->year;

        $d = new \DateTime($year.'-07-01'); // 2014-07-01
        $n = $d->format('N');
        while ($n<>1) {
            $d->modify('+1 day');
            $n = $d->format('N');
        }
        $d->modify('+15 days');

        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.EuropeanChampionship.start');
        $e->setVisibility('foreground');
        $e->setDescr("Preparation de l'Euro $edition");
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();

        $fla = new Flash($this->schema);
        $fla->setSubject("Finale de l'Euro ".$this->cpi_data->year);
        $fla->setBody($team->getName() . " remporte l'Euro ".$this->cpi_data->year);
        $fla->save();
    }
}

/*
$g = new Game;
$g->load('g_30');
$e = new Event('g_30');
$e->load(46);
$w = new EuropeanChampionship;
$w->end($g,$e);
*/


