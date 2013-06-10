<?php

namespace Manafoot\ComponentBundle\Fifa;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;

class WorldCup {

    private $game;
    private $event;

    const CPT_ID = 1;

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
        // concacaf : 
        // conmebol
        // afc
        // uefa
        // ofc
        // caf

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

        $event->setStatus('ok');
        $event->save();

        // new Message
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


