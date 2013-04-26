<?php

namespace Manafoot\ComponentBundle\Fifa;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Session;
use \Manafoot\ComponentBundle\Event;

class Elo {

    // Publish new Elo ranking
    public function pub (Event $event) {

        $session = new Session;
        $db = new Database;

        $schema = $session->get('schema');

        $sql = "insert into $schema.elh_elo_history select elo_tea_id,elo_points,{$event->evt_id}, '{$event->evt_date}' from $schema.elo_elo";
        $db->query($sql);

        // new Message

        // next Elo publishing
        $d = new DateTime($event->getDate());
        $d->modify('+1 month');
        $e = new Event;
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.Elo.pub');
        $e->setVisibility('foreground');
        $e->save();
    }

}


