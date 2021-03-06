<?php

namespace Manafoot\ComponentBundle\Fifa;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Cup;
use \Manafoot\ComponentBundle\Championship;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Utils;
use \Manafoot\ComponentBundle\Team;
use \Manafoot\ComponentBundle\Flash;

class WorldCup {

    private $game;
    private $event;

    const CPT_ID = 1;
    const PLAYOFF_CPT_ID = 8;

    // must be set to third monday of july, 2010-07-19
    public function  start (Game $game, Event $event) {

        $HOST_COUNTRY = array(
            2014 => array('tea_id'=>44, 'host_name'=>'Brésil'),
            2018 => array('tea_id'=>94, 'host_name'=>'Russie'),
            2022 => array('tea_id'=>195, 'host_name'=>'Quatar'),
        );
        $this->game = $game;
        $this->event = $event;

        $db = new Database;
        $schema = $this->game->getName();

        $params = json_decode($event->getParams());

        $evt_date = new \DateTime($event->getDate());
        $year =  4 + $evt_date->format('Y');

        $comp = new Competition($schema);
        $comp->get(WorldCup::CPT_ID);
        $ci_params = json_encode(array(
            'year' => $year,
            'host_tea_id' => $HOST_COUNTRY[$year]['tea_id'],
        ));
        $ci = $comp->makeInstance($year,$ci_params);

        // dispatch on every international federation

        $d = new \DateTime($game->getResumeDate());
        $d->modify('+254 day'); // 2011-03-30

        $params = json_encode(array(
            'year' => $year,
            'host_tea_id' => $HOST_COUNTRY[$year]['tea_id'],
            'master_ci_id' => $ci->getId(),
            'master_cpi_id' => $ci->getId(),
        ));

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Concacaf');
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Asie');
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        $d->modify('+122 day'); // 2011-07-30

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Conmebol');
        $e->setAssociation(15);
        $e->setFunction('Fifa.Conmebol.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Océanie');
        $e->setAssociation(14);
        $e->setFunction('Fifa.Ofc.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Afrique');
        $e->setAssociation(12);
        $e->setFunction('Fifa.Caf.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des éliminatoires de la coupe du monde de football 2014 : zone Europe');
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.WorldCupQualification.start');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();

        // will set international playoff
        $d = new \DateTime($game->getResumeDate()); // back to 2010-07-19
        $d->modify('+1186 days');

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort des barrages de la coupe du monde de football 2014');
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.barrage');
        $e->setParams($params);
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();


        $event->setStatus('ok');
        $event->save();

        // new Message
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
        if (isset($this->evt_params->master_cpi_id)) {
            $this->cpi->get($this->evt_params->master_cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
        else if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }
    public function barrage($game, $event) {
        $this->setupEnv($game,$event);
        // insert new cpi
        $comp = new Competition($this->schema);
        $comp->get(self::PLAYOFF_CPT_ID);
        $data = json_encode(array(
            'master_cpi_id' => $this->evt_params->master_ci_id,
        ));
        $cpi = $comp->makeInstance($this->evt_params->year,$data);

        $teams = [ $this->cpi_data->playoff_13, $this->cpi_data->playoff_14, $this->cpi_data->playoff_15, $this->cpi_data->playoff_16 ];
        shuffle($teams);
        $pot1 = [ array_pop($teams), array_pop($teams) ];
        $pot2 = [ array_pop($teams), array_pop($teams) ];
        
        $d = new \DateTime($event->getDate()); // 2013-10-17
        $d->modify("+29 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+4 days");
        $date2 = $d->format('Y-m-d');
        $cup = new Cup;
        $cup->setHomeAwayMatch($game,$cpi->getId(),'a','b',$pot1,$pot2,$date1,$date2);

        $d->modify('+2 days'); // 2013-11-21
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setDescr('Tirage au sort du 1er tour de la Coupe du monde de football '.$this->cpi_data->year);
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.round1');
        $e->setParams(json_encode(array(
            'master_cpi_id' => $this->cpi->getId(),
            'slave_cpi_id' => $cpi->getId(),
        )));
        $e->setVisibility('foreground');
        $e->setStatus('todo');
        $e->save();
    }

    public function round1 ($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;
        $ch = new Championship;
        $caf = $au->subRange($this->cpi_data->qualified_12, 0, 4);

        $cpi = new Competition\Instance($this->schema);
        $cpi->get($this->evt_params->slave_cpi_id);
        $playoff = $cup->getQualifiedTeams($game, $cpi->getId(), 'b');
        $qualTeams = array_merge($this->cpi_data->qualified_11, $caf, $this->cpi_data->qualified_13, $this->cpi_data->qualified_15, $this->cpi_data->qualified_16, $playoff);
        $qualTeams[] = $this->cpi_data->host_tea_id;
        $qualTeams = Elo::sortTeam($this->schema, $qualTeams);
        $pot1 = $au->subRange($qualTeams,0,7);
        $pot2 = $au->subRange($qualTeams,8,15);
        $pot3 = $au->subRange($qualTeams,16,23);
        $pot4 = $au->subRange($qualTeams,24,31);
        shuffle($pot1);
        shuffle($pot2);
        shuffle($pot3);
        shuffle($pot4);
        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2013-11-21
        $precDate = '2013-11-21';
        $scheduleDate = ['2014-06-13', '2014-06-18', '2014-06-23'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }
        for ($i=1; $i<=8; $i++) {
            $gr = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
            $ch->roundRobin($this->schema, $gr, $this->cpi, $schedule, "1g$i.", false);
        }

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.round2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    
    public function round2($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;
        $ch = new Championship;
        $ranks = [];

        for ($i=1; $i<=8; $i++) {
            $rank = $ch->getRank($this->schema, $this->cpi->getId(), "1g$i%");
            $ranks[] = $rank;
        }

        $d = new \DateTime($event->getDate()); // 2014-06-24
        $d->modify('+4 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.1',$ranks[0][0]['tea_id'], $ranks[1][1]['tea_id'], $date1);
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.2',$ranks[1][0]['tea_id'], $ranks[0][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.3',$ranks[2][0]['tea_id'], $ranks[3][1]['tea_id'], $date1);
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.4',$ranks[3][0]['tea_id'], $ranks[2][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.5',$ranks[4][0]['tea_id'], $ranks[5][1]['tea_id'], $date1);
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.6',$ranks[5][0]['tea_id'], $ranks[4][1]['tea_id'], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.7',$ranks[6][0]['tea_id'], $ranks[7][1]['tea_id'], $date1);
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'2.8',$ranks[7][0]['tea_id'], $ranks[6][1]['tea_id'], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.cup8');
        $e->setVisibility('foreground');
        $e->setDescr('Huitiemes de finale de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();

    }

    public function cup8($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '2.');

        $d = new \DateTime($event->getDate()); // 2014--07-02
        $d->modify('+2 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.1',$quals[0], $quals[1], $date1);
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.2',$quals[2], $quals[3], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.3',$quals[4], $quals[5], $date1);
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'3.4',$quals[6], $quals[7], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.cup4');
        $e->setVisibility('foreground');
        $e->setDescr('Quarts de finale de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function cup4($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '3.');

        $d = new \DateTime($event->getDate()); // 2014--07-06
        $d->modify('+2 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'4.1',$quals[0], $quals[1], $date1);
        $d->modify('+1 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'4.2',$quals[2], $quals[3], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.cup2');
        $e->setVisibility('foreground');
        $e->setDescr('Demi-finales de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }
    public function cup2($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '4.');

        $d = new \DateTime($event->getDate()); // 2014-07-10
        $d->modify('+3 day');
        $date1 = $d->format('Y-m-d');
        $cup->setNeutralMatch($this->schema,$this->cpi->getId(),'5.1',$quals[0], $quals[1], $date1);

        $d->modify('+1 day');
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.end');
        $e->setVisibility('foreground');
        $e->setDescr('Finale de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function end($game, $event) {
        $this->setupEnv($game,$event);
        $au = new Utils\Range;
        $cup = new Cup;

        $quals = $cup->getQualifiedNeutralMatch($this->schema, $this->cpi->getId(), '5.');

        $team = new Team;
        $team->get($quals[0]);

        $d = new \DateTime($event->getDate()); // 2014-07-14
        $j = (int)$d->format('d');
        while ($j>7) {
            $d->modify('-7 days');
            $j = (int)$d->format('d');
        }
        $d->modify('+14 days');

        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.WorldCup.start');
        $e->setVisibility('foreground');
        $e->setDescr('Preparation de la Coupe du Monde');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();

        $fla = new Flash($this->schema);
        $fla->setSubject("Finale de la Coupe du monde");
        $fla->setBody($team->getName() . " remporte la Coupe du Monde ".$this->cpi->year);
        $fla->save();
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
    public function addPlayoffTeam ($schema, $cpi_id, $ass_id, $tea_id) {
        $cpi = new Competition\Instance($schema);
        $cpi->get($cpi_id);
        $data = json_decode($cpi->getData());
        $col = "playoff_$ass_id";
        $data->$col = $tea_id;
        $cpi->setData(json_encode($data));
        $cpi->save();
    }

}

/*
$g = new Game;
$g->load('g_20');
$e = new Event('g_20');
$e->load(74);
$w = new WorldCup;
$w->end($g,$e);
*/


