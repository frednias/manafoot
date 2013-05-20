<?php

namespace Manafoot\ComponentBundle\Fifa\Conmebol;

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
use \Manafoot\ComponentBundle\Team;

class WorldCupQualification {

    const CPT_ID = 3;

    // Starting World Cup Qualifications
    // Enters all conmebol national team = X
    // exclude world wup host team
    // full round robin

    public function start (Game $game, Event $event) {

        $db = new Database;
        $schema = $game->getName();
        $evtId = $event->getId();
        $teams = array();
        $params = json_decode($event->getParams());
        $hostTeamId = $params->host_tea_id;

        // find and sort available team by elo points
        $sql = "
            SELECT elh_tea_id,cou_name,elh_points 
            FROM ass_association 
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=15) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            AND elh_tea_id<>$hostTeamId
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $teams[] = $obj->elh_tea_id; 
        }
        $n = count($teams);

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);
        $ci = $comp->makeInstance($params->year,$data);

        shuffle($teams);

        // compute round robin
        $chrr = new Championship;

        $d = new \DateTime($event->getDate()); // 2011-07-30
        $schedule = [0]; // 18 round
        $dec = [69,4,31,4,200,7,90,4,31,4,157,4,73,4,89,2,31,4];
        foreach ($dec as $nbj) {
            $d->modify("+$nbj days");
            $schedule[] = $d->format('Y-m-d');
        }
    
        $cal = $chrr->roundRobin($schema, $teams, $ci, $schedule, "");

        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(15);
        $e->setFunction('Fifa.Conmebol.WorldCupQualification.barrage');
        $e->setVisibility('foreground');
        $e->setDescr('Fin du tour preliminaire de la Coupe du Monde, zone Concacaf');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();

    }
}

/*
$g = new Game;
$g->load('g_5');
$e = new Event('g_5');
$e->load(4);
$w = new WorldCupQualification;
$w->start($g,$e);
*/

