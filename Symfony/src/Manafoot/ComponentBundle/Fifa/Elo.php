<?php

namespace Manafoot\ComponentBundle\Fifa;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;

class Elo {

    // Publish new Elo ranking
    public function pub (Game $game, Event $event) {

        $db = new Database;

        $schema = $game->getName();

        $sql = "insert into $schema.elh_elo_history select elo_tea_id,elo_points,{$event->getId()}, '{$event->getDate()}' from $schema.elo_elo";
        $db->query($sql);

        // new Message

        // next Elo publishing
        $d = new \DateTime($event->getDate());
        $d->modify('+1 month');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.Elo.pub');
        $e->setVisibility('foreground');
        $e->setDescr('Classement mondial FIFA - '.$d->format('F Y'));
        $e->setStatus = 'todo';
        $e->save();
    }

}


