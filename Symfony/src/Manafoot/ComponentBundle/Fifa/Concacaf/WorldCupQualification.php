<?php

namespace Manafoot\ComponentBundle\Fifa\Concacaf;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Match;
use \Manafoot\ComponentBundle\Flash;

class WorldCupQualification {

    const CPT_ID = 2;

    // Starting World Cup Qualifications
    // Enters all concacaf national team = X
    // 1st round is (X-30)*2 worst team in A/R oppopsition => X-30 team qualifies

    public function start (Game $game, Event $event) {

        $db = new Database;
        $schema = $game->getName();
        $evtId = $event->getId();
        $teams = array();
        $params = json_decode($event->getParams());
        $li = '';

        // find and sort available team by elo points
        $sql = "
            SELECT elh_tea_id,cou_name,elh_points 
            FROM ass_association 
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=16) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            ORDER BY elh_points desc";        

        $db->query($sql);
        while ($obj = $db->fetch()) {
            $teams[] = $obj; 
        }

        $n = count($teams);

        $data = json_encode($teams);

        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);

        // insert new cpi
        $ci = $comp->makeInstance($params->year,$data);

        // compute 1st round matchs
        $nb_eq = ($n-30)*2;
        $tm = array();
        for ($i=$n-$nb_eq;$i<$n;$i++) {
            $tm[] = $teams[$i];
        }
        shuffle($tm);

        $matchs = array();
        $d1 = new \DateTime($event->getDate());
        $d2 = new \DateTime($event->getDate());
        $x = 123;
        $y = 130;
        $d1->modify("+$x day");
        $d2->modify("+$y day");
        for($m=1;$m<=$n-30;$m++) {
            $e1 = array_pop($tm);
            $e2 = array_pop($tm);

            $mat1 = new Match($schema);
            $mat1->setCompetitionInstance($ci->getId());
            $mat1->setRound('1a');
            $mat1->setTeam1($e1->elh_tea_id);
            $mat1->setTeam2($e2->elh_tea_id);
            $mat1->setDate($d1->format('Y-m-d'));
            $mat1->save();

            $mat2 = new Match($schema);
            $mat2->setCompetitionInstance($ci->getId());
            $mat2->setRound('1b');
            $mat2->setTeam1($e2->elh_tea_id);
            $mat2->setTeam2($e1->elh_tea_id);
            $mat2->setDate($d2->format('Y-m-d'));
            $mat2->save();

            $li .= "<li>".$e1->cou_name." - ".$e2->cou_name."</li>";
        }

        $d = new \DateTime($event->getDate());
        $d->modify('+131 day');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.tour2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour de qualifications de la Coupe du Monde, zone Concacaf');
        $e->setStatus('todo');
        $e->save();

        $body = "
            <p>Le tirage au sort du 1er tour de qualification pour la Coupe du Monde zone Concacaf, a eu lieu aujourd'hui a Rio de Janeiro</p>
            <p>Les matchs aller se derouleront le 11 juillet. les matchs retour le 18 juillet.</p>
            <p>Les rencontres :<br>
            <ul>
                $li
            </ul></p>
        ";
        $f = new Flash($schema);
        $f->setSubject('Tirage au sort du 1er tour de qualification pour la Coupe du Monde zone Concacaf');
        $f->setBody($body);
        $f->save();
    }

}

/*
include_once('../../../../../../tests/autoload.php');
$g = new Game;
$g->load('g_4');
$e = new Event('g_4');
$e->load(2);
$w = new WorldCupQualification;
$w->start($g,$e);
*/

