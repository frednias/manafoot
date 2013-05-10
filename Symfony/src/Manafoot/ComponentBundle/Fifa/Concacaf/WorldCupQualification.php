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
use \Manafoot\ComponentBundle\Championship;
use \Manafoot\ComponentBundle\Team;

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
        $chrr = new Championship;

        foreach($group as $n => $g) {
            $g = $n+1;
            $cal = $chrr->roundRobin($schema, $group[$n], $ci, $schedule, "2g$g.");
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

        //petit message Flash ?
    }

    public function round3($game, $event) {
        $db = new Database;
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $ci_id = $params->ci;
        $ci = new Competition\Instance($schema);
        $ci->get($ci_id);
        $data = json_decode($ci->getData());

        $pot1 = [$data[0]->elh_tea_id, $data[1]->elh_tea_id, $data[2]->elh_tea_id];
        $pot2 = [$data[3]->elh_tea_id, $data[4]->elh_tea_id, $data[5]->elh_tea_id];

        for($g=1;$g<=6;$g++) {
            $cla = $this->getRank($schema, $ci_id, "2g$g%");
            $pot3[] = $cla[0]['tea_id'];
        }

        shuffle($pot1);
        shuffle($pot2);
        shuffle($pot3);

        $group = array(
            array( array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot3)),
            array( array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot3)),
            array( array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot3)),
        );

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2011-11-15
        $d->modify('+206 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+5 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+86 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+31 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');

        // compute round robin
        $chrr = new Championship;

        foreach($group as $n => $g) {
            $g = $n+1;
            $cal = $chrr->roundRobin($schema, $group[$n], $ci, $schedule, "3g$g.");
        }

        $d->modify('+1 day');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.WorldCupQualification.round4');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 4e tour de qualifications de la Coupe du Monde, zone Concacaf');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();
    }

    public function round4($game, $event) {
        $db = new Database;
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $ci_id = $params->ci;
        $ci = new Competition\Instance($schema);
        $ci->get($ci_id);
        $data = json_decode($ci->getData());

        $pot = [];
        for($g=1;$g<=3;$g++) {
            $cla = $this->getRank($schema, $ci_id, "3g$g%");
            $pot[] = $cla[0]['tea_id'];
            $pot[] = $cla[1]['tea_id']; // first and second qualifier
        }

        shuffle($pot);

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2012-10-17
        $d->modify('+112 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+44 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+73 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+7 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+80 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+31 day');
        $schedule[] = $d->format('Y-m-d');
        $d->modify('+4 day');
        $schedule[] = $d->format('Y-m-d');

        // compute round robin
        $chrr = new Championship;

        $cal = $chrr->roundRobin($schema, $pot, $ci, $schedule, "4g.");

        $d->modify('+1 day');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(16);
        $e->setFunction('Fifa.Concacaf.WorldCupQualification.barrage');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du barrage de qualifications de la Coupe du Monde, zone Concacaf / Ofc');
        $e->setStatus('todo');
        $e->setParams('{"ci":'.$ci->getId().'}');
        $e->save();
    }

    public function barrage($game, $event) {
        $db = new Database;
        $schema = $game->getName();
        $params = json_decode($event->getParams());
        $ci_id = $params->ci;
        $ci = new Competition\Instance($schema);
        $ci->get($ci_id);
        $data = json_decode($ci->getData());

        $cla = $this->getRank($schema, $ci_id, "4g%");

        foreach($cla as $rank) {
            $team = new Team;
            $team->get($rank['tea_id']);
            echo $team->getName()."\n";
        }
    }

    public function getRank($schema, $cpi_id, $round = '%') {
        $db = new Database;
        $listTeam = [];
        $qualteam = $f = $a = $w = $d = $l = $pts = $diff = [];

        $sql = "
            select * 
            from $schema.mat_match  
            where mat_round like '$round' and mat_cpi_id='$cpi_id'
            order by mat_date asc;
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $listTeam[] = $obj->mat_tea_id__1;
            $listTeam[] = $obj->mat_tea_id__2;

            if ($obj->mat_score__1 > $obj->mat_score__2) {
                $w[$obj->mat_tea_id__1] ++;
                $l[$obj->mat_tea_id__2] ++;
            }
            else if ($obj->mat_score__1 < $obj->mat_score__2) {
                $l[$obj->mat_tea_id__1] ++;
                $w[$obj->mat_tea_id__2] ++;
            }
            else {
                $d[$obj->mat_tea_id__1] ++;
                $d[$obj->mat_tea_id__2] ++;
            }
            $f[$obj->mat_tea_id__1] += $obj->mat_score__1;
            $f[$obj->mat_tea_id__2] += $obj->mat_score__2;
            $a[$obj->mat_tea_id__1] += $obj->mat_score__2;
            $a[$obj->mat_tea_id__2] += $obj->mat_score__1;
        }
        $listTeam = array_unique($listTeam);
        $cla = array();
        foreach($listTeam as $n => $tea_id) {
            $clan['tea_id'] = $tea_id;
            $clan['win'] = $w[$tea_id];
            $clan['draw'] = $d[$tea_id];
            $clan['loose'] = $l[$tea_id];
            $clan['for'] = $f[$tea_id];
            $clan['against'] = $a[$tea_id];
            $clan['pts'] = 3*$clan['win']+$clan['draw'];
            $clan['diff'] = $clan['for'] - $clan['against'];
            $cla[] = $clan;
        }
        for ($i=0;$i<count($listTeam)-1;$i++) {
            for ($j=$i;$j<count($listTeam);$j++) {
                if ($cla[$i]['pts'] < $cla[$j]['pts'] || $cla[$i]['pts'] == $cla[$j]['pts'] && $cla[$i]['diff'] < $cla[$j]['diff']) {
                    $tmp = $cla[$i];
                    $cla[$i] = $cla[$j];
                    $cla[$j] = $tmp;
                }
            }
        }
        return $cla;
    }

}

/*
$g = new Game;
$g->load('g_4');
$e = new Event('g_4');
$e->load(26);
$w = new WorldCupQualification;
$w->barrage($g,$e);
*/

