<?php

namespace Manafoot\ComponentBundle\Fifa\Ofc;

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

    const CPT_ID = 4;

    // Starting World Cup Qualifications
    // Enters all Ofc national team = X (10 or 11)
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
        $n = count($teams); // 10 or 11 teams

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);
        $data = json_encode(array(
            'teams' => $teams,
            'master_ci_id' => $params->master_ci_id,
        ));
        $ci = $comp->makeInstance($params->year,$data);

        $firstRoundTeams = []; // 4 teams
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
        $e->setFunction('Fifa.Ofc.WorldCupQualification.round2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour preliminaire de la Coupe du Monde, zone Océanie');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();
    }

    public function round2($game, $event) {
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $chrr = new Championship;
        $cpi = new Competition\Instance($schema);
        $cpi->get($params->ci);
        $cpi_data = json_decode($cpi->getData());
        $round2Teams = [];

        $n = count($cpi_data->teams); // 10 or 11
        for ($i=0; $i<$n-4; $i++) {
            $round2Teams[] = $cpi_data->teams[$i]; // exempted from 1st round
        }
        $rank = $chrr->getRank($schema, $params->ci, "1.%");
        for ($i=0; $i<12-$n; $i++) {
            // fill to 8 teams
            $round2Teams[] = $rank[$i]['tea_id'];
        }

        $pot1 = [];
        for ($i=0; $i<4; $i++) {
            $pot1[] = $round2Teams[$i];
        }
        $pot2 = [];
        for ($i=4; $i<8; $i++) {
            $pot2[] = $round2Teams[$i];
        }
        // 2 teams from each pot
        shuffle($pot1);
        shuffle($pot2);
        $gr1 = [array_pop($pot1), array_pop($pot1), array_pop($pot2), array_pop($pot2)];
        $gr2 = [array_pop($pot1), array_pop($pot1), array_pop($pot2), array_pop($pot2)];

        $d = new \DateTime($event->getDate()); //2011-11-27
        //1, 3, 5 june 2012
        $schedule = [0];
        $d->modify('+156 days');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+2 days');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+2 days');
        $schedule[] = $d->format('Y-m-d');

        $cal = $chrr->roundRobin($schema, $gr1, $cpi, $schedule, "2g1.", false);
        $cal = $chrr->roundRobin($schema, $gr2, $cpi, $schedule, "2g2.", false);

        $d->modify("+1 days"); // 2012-05-06
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(14);
        $e->setFunction('Fifa.Ofc.WorldCupQualification.round3');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 3e tour preliminaire de la Coupe du Monde, zone Océanie');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$cpi->getId().'}');
        $e->save();
    }

    public function round3($game,$event) {
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $cpi = new Competition\Instance($schema);
        $cpi->get($params->ci);
        $cpi_data = json_decode($cpi->getData());
        $chrr = new Championship;

        // get 2 first of each group
        // compute group with 4 team
        // first go to barrage with concacaf

        $rank1 = $chrr->getRank($schema, $params->ci, "2g1.%");
        $rank2 = $chrr->getRank($schema, $params->ci, "2g2.%");

        $gr = [ $rank1[0]['tea_id'], $rank1[1]['tea_id'], $rank2[0]['tea_id'], $rank2[1]['tea_id'] ];
        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2012-05-06
        $precDate = '2012-05-06';
        $scheduleDate = ['2012-09-07', '2012-09-11', '2012-10-12', '2012-10-16', '2013-03-22', '2013-03-26'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }

        $cal = $chrr->roundRobin($schema, $gr, $cpi, $schedule, "3.", true);

        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(14);
        $e->setFunction('Fifa.Ofc.WorldCupQualification.barrage');
        $e->setVisibility('foreground');
        $e->setDescr('Barrage pour la Coupe du Monde, zone Océanie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$cpi->getId().'}');
        $e->save();
    }

    public function barrage($game,$event) {
        $chrr = new Championship;
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $cpi = new Competition\Instance($schema);
        $cpi->get($params->cpi_id);
        $cpi_data = json_decode($cpi->getData());
        //2013-03-27
        // set barragist

        $rank = $chrr->getRank($schema, $params->cpi_id, "3.%");
        $bar = $rank[0]['tea_id'];

        $flash = new Flash($schema);
        $flash->setSubject($rank[0]['tea_name']." se qualifie pour les barrages de la Coupe du Monde");
        $flash->setBody($rank[0]['tea_name']." termine 1er de son groupe de qualification pour la Coupe du Monde et se qualifie pour le match de barrage contre un representant de la zone Concacaf");
        $flash->save();
    }
}

/*
$g = new Game;
$g->load('g_5');
$e = new Event('g_5');
$e->load(14);
$w = new WorldCupQualification;
$w->barrage($g,$e);
*/


