<?php

namespace Manafoot\ComponentBundle\Fifa\Ofc;

require "/home/www/manafoot.com/tests/autoload.php";

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

    const CPT_ID = 4;

    // Starting World Cup Qualifications
    // Enters all Ofc national team = X
    // exclude world wup host team
    // half round robin for 4 last teams

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
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=14) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            AND elh_tea_id<>$hostTeamId
            order by elh_points desc
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $teams[] = $obj->elh_tea_id; 
        }
        $n = count($teams);

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);
        $data = json_encode(array(
            'teams' => $teams,
            'master_ci_id' => $params->master_ci_id,
        ));
        $ci = $comp->makeInstance($params->year,$data);

        $firstRoundTeams = [];
        for ($i=count($teams)-4; $i<count($teams); $i++) {
            $firstRoundTeams[] = $teams[$i];
        }

        // compute round robin
        $chrr = new Championship;

        $d = new \DateTime($event->getDate()); // 2011-07-30
        $schedule = [0];
        $d->modify('+115 days');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+2 days');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+2 days');
        $schedule[] = $d->format('Y-m-d');
    
        $cal = $chrr->roundRobin($schema, $firstRoundTeams, $ci, $schedule, "1.", false);

        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(14);
        $e->setFunction('Fifa.Ofc.WorldCupQualification.tour2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour preliminaire de la Coupe du Monde, zone Océanie');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();

    }
}


$g = new Game;
$g->load('g_5');
$e = new Event('g_5');
$e->load(6);
$w = new WorldCupQualification;
$w->start($g,$e);


