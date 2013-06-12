<?php

namespace Manafoot\ComponentBundle\Fifa;

require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Cup;
use \Manafoot\ComponentBundle\Competition;

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


$g = new Game;
$g->load('g_18');
$e = new Event('g_18');
$e->load(9);
$w = new WorldCup;
$w->barrage($g,$e);



