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
use \Manafoot\ComponentBundle\Fifa;

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

        $data = json_encode(array(
            'teams' => $teams,
            'master_cpi_id' => $params->master_cpi_id
        ));

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
        $e->setDescr('Fin du tour preliminaire de la Coupe du Monde, zone Conmebol');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$ci->getId().'}');
        $e->save();
    }

    public function barrage($game, $event) {
        $db = new Database;
        $schema = $game->getName();
        $evtId = $event->getId();
        $teams = array();
        $params = json_decode($event->getParams());
        $hostTeamId = $params->host_tea_id;
        $ch = new Championship;

        $cpi = new Competition\Instance($schema);
        $cpi->get($params->cpi_id);
        $data = json_decode($cpi->getData());
    

        $rank = $ch->getRank($schema, $params->cpi_id, "%");
        $qualTeams = [ $rank[0]['tea_id'], $rank[1]['tea_id'], $rank[2]['tea_id'], $rank[3]['tea_id'] ];
        $wc = new Fifa\WorldCup;
        $wc->addQualifiedTeams($schema, $data->master_cpi_id,15,$qualTeams);
        $wc->addPlayoffTeam($schema, $data->master_cpi_id, 15, $rank[4]['tea_id']);
    }
}

/*
$g = new Game;
$g->load('g_9');
$e = new Event('g_9');
$e->load(19);
$w = new WorldCupQualification;
$w->barrage($g,$e);
*/

