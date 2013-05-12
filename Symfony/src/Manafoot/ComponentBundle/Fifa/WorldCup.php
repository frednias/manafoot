<?php

namespace Manafoot\ComponentBundle\Fifa;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;

class WorldCup {

    private $game;
    private $event;

    // must be set to third monday of july, 2010-07-19
    public function  start (Game $game, Event $event) {

        $this->game = $game;
        $this->event = $event;

        $db = new Database;
        $schema = $this->game->getName();

        $params = json_decode($event->getParams());

        $evt_date = new \DateTime($event->getDate());
        $year =  4 + $evt_date->format('Y');

        // dispatch on every international federation
        // concacaf : 
        // conmebol
        // afc
        // uefa
        // ofc
        // caf

        $d = new \DateTime($game->getResumeDate());
        $d->modify('+234 day'); // 2011-03-10

        $params = json_encode(array(
            'year' => $year
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

        //$concacaf = new Concacaf/WorldCupQualification;
        //$concacaf->start($game, $event);


        $event->setStatus('ok');
        $event->save();

        // new Message

/*
        // next Elo publishing
        $d = new \DateTime($event->getDate());
        $d->modify('+1 month');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.Elo.pub');
        $e->setVisibility('foreground');
        $e->setDescr('Classement mondial FIFA - '.$d->format('F Y'));
        $e->setStatus('todo');
        $e->save();
*/

    }

}


