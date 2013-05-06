<?php

namespace Manafoot\ComponentBundle\Fifa\Concacaf;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Competition\Instance;
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
            $mat1->setType(4);
            $mat1->save();

            $mat2 = new Match($schema);
            $mat2->setCompetitionInstance($ci->getId());
            $mat2->setRound('1b');
            $mat2->setTeam1($e2->elh_tea_id);
            $mat2->setTeam2($e1->elh_tea_id);
            $mat2->setDate($d2->format('Y-m-d'));
            $mat2->setType(5);
            $mat2->save();
            $mat2->setMatchReferer($mat1->getId());

            $li .= "<li>".$e1->cou_name." - ".$e2->cou_name."</li>";
        }

        $d = new \DateTime($event->getDate());
        $d->modify('+131 day');

        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.WorldCupQualification.round2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour de qualifications de la Coupe du Monde, zone Concacaf');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
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

    public function round2($game, $event) {
        $db = new Database;
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $ci_id = $params->ci;
        $teamRound1 = [];

        // find qualified teams

        $sql = "
            select mr.mat_tea_id__1, mr.mat_tea_id__2, mr.mat_score__1 as mr1, mr.mat_score__2 as mr2, mr.mat_tab__1, mr.mat_tab__2, ma.mat_score__1 as ma1, ma.mat_score__2 as ma2 
            from $schema.mat_match mr 
            inner join $schema.mar_match_referer on mar_mat_id=mat_id 
            inner join $schema.mat_match ma on mar_mat_id__referer=ma.mat_id  
            where mr.mat_cpi_id={$ci_id} and mr.mat_round='1b';
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $total1 = $obj->mr1 + $obj->ma2;
            $total2 = $obj->mr2 + $obj->ma1;
            if ($total1 > $total2) {
                $teamRound1[] = $obj->mat_tea_id__1;
            }
            else if ($total2 > $total1) {
                $teamRound1[] =  $obj->mat_tea_id__2;
            }
            else if ($obj->mr2 > $obj->ma2) {
                $teamRound1[] = $obj->mat_tea_id__2;
            }
            else if ($obj->ma2 > $obj->mr2) {
                $teamRound1[] = $obj->mat_tea_id__1;
            }
            else if ($obj->mat_tab__1 > $obj->mat_tab__2) {
                $teamRound1[] = $obj->mat_tea_id__1;
            }
            else if ($obj->mat_tab__2 > $obj->mat_tab__1) {
                $teamRound1[] = $obj->mat_tea_id__2;
            }
            else {
                //cas impossible
            }
        }
        $ci = new Competition\Instance($schema);
        $ci->get($ci_id);
        $data = json_decode($ci->getData());

        $pot4 = [];
        $pot5 = [];
        $pot6 = [];
        $pot7 = [];
        for($i=6;$i<=11;$i++) {
            $pot4[] = $data[$i]->elh_tea_id;
        }
        for($i=12;$i<=17;$i++) {
            $pot5[] = $data[$i]->elh_tea_id;
        }
        for($i=18;$i<=23;$i++) {
            $pot6[] = $data[$i]->elh_tea_id;
        }
        $pot7 = array_merge($teamRound1,[$data[25]->elh_tea_id]);

        shuffle($pot4);
        shuffle($pot5);
        shuffle($pot6);
        shuffle($pot7);

        // 6 groupe de 4
        $group = array(
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
            array(array_pop($pot4),array_pop($pot5),array_pop($pot6),array_pop($pot7)),
        );

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2011-07-19
        $d->modify('+45 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+31 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+31 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+3 day');
        $schedule[] = $d->format('Y-m-d');


        // compute round robin

        foreach($group as $n => $g) {
            $cal = $this->roundRobin($group[$n]);
            $nc = count($cal);
            $ng = $n+1;
            foreach ($cal as $round => $matchs) {
                $mat1 = new Match($schema);
                $mat1->setCompetitionInstance($ci->getId());
                $mat1->setRound('2g'.$ng.'.'.$round);
                $mat1->setTeam1($matchs[0][0]);
                $mat1->setTeam2($matchs[0][1]);
                $mat1->setDate($schedule[$round]);
                $mat1->setType(2);
                $mat1->save();

                $mat2 = new Match($schema);
                $mat2->setCompetitionInstance($ci->getId());
                $mat2->setRound('2g'.$ng.'.'.$round);
                $mat2->setTeam1($matchs[1][0]);
                $mat2->setTeam2($matchs[1][1]);
                $mat2->setDate($schedule[$round]);
                $mat2->setType(2);
                $mat2->save();

                $rr = $round + $nc;

                $matr1 = new Match($schema);
                $matr1->setCompetitionInstance($ci->getId());
                $matr1->setRound('2g'.$ng.'.'.$rr);
                $matr1->setTeam1($matchs[0][1]);
                $matr1->setTeam2($matchs[0][0]);
                $matr1->setDate($schedule[$rr]);
                $matr1->setType(2);
                $matr1->save();

                $matr2 = new Match($schema);
                $matr2->setCompetitionInstance($ci->getId());
                $matr2->setRound('2g'.$ng.'.'.$rr);
                $matr2->setTeam1($matchs[1][1]);
                $matr2->setTeam2($matchs[1][0]);
                $matr2->setDate($schedule[$rr]);
                $matr2->setType(2);
                $matr2->save();
            }
        }

        $d->modify('+1 day');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.WorldCupQualification.round3');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 3e tour de qualifications de la Coupe du Monde, zone Concacaf');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();
    }

    public function roundRobin($listTeam) {
        $n = count($listTeam);
        $cal = [];
        for($i=1;$i<=$n;$i++) {
            for($j=$i;$j<=$n;$j++) {
                $m = null;
                if ($j!=$n && $i!=$n && $i!=$j) {
                    if ($i+$j-1 < $n) {
                        $r = $i + $j - 1 ;
                        $m = [$listTeam[$i-1], $listTeam[$j-1]];
                    }
                    if ($i+$j-1 >= $n) {
                        $r = $i + $j - $n;
                        $m = [$listTeam[$i-1], $listTeam[$j-1]];
                    }
                    if ((($i+$j)%2) == 0) {
                        $tmp = $m;
                        $m[0] = $tmp[1];
                        $m[1] = $tmp[0];
                    }
                }
                if ($j==$n && $i!=$j) {
                    if ((2*$i) <= $n) {
                        $r = 2 * $i - 1;
                        $m = [$listTeam[$i-1], $listTeam[$j-1]];
                    }
                    if ((2*$i) > $n) {
                        $r = 2 * $i - $n;
                        $m = [$listTeam[$j-1], $listTeam[$i-1]];
                    }
                }
                if ($m) {
                    $cal[$r][] = $m;
                }
            }
        }
        return $cal;
    }
}

/*
$g = new Game;
$g->load('g_4');
$e = new Event('g_4');
$e->load(14);
$w = new WorldCupQualification;
$w->round2($g,$e);
*/
