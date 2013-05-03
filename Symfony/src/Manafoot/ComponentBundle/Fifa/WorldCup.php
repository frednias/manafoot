<?php

namespace Manafoot\ComponentBundle\Fifa;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;

class WorldCup {

    private $game;
    private $event;

    // Publish new Elo ranking
    public function  start (Game $game, Event $event) {
        $this->game = $game;
        $this->event = $event;

        $db = new Database;
        $schema = $this->game->getName();

        // dispatch on every international federation
        // concacaf
        // conmebol
        // afc
        // uefa
        // ofc
        // caf

        $concacaf = new Concacaf/WorldCupQualification;
        $concacaf->start($game, $event);

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


