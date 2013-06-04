<?php

namespace Manafoot\ComponentBundle;

//require('../../../../tests/autoload.php');
use \Manafoot\ComponentBundle\Entity;
use \Manafoot\ComponentBundle\Database;

class Championship {

    public function roundRobin($schema, $items, $ci, $schedule = null, $prefix = '', $homeaway = true) {
        $n = count($items);
        if ($n%2==1) $items[] = 0;
        $n = count($items);
        $cal = [];
        for($i=1;$i<=$n;$i++) {
            for($j=$i;$j<=$n;$j++) {
                $m = null;
                if ($j!=$n && $i!=$n && $i!=$j && $items[$i-1]!=0 && $items[$j-1]!=0) {
                    if ($i+$j-1 < $n) {
                        $r = $i + $j - 1 ;
                        $m = [$items[$i-1], $items[$j-1]];
                    }
                    if ($i+$j-1 >= $n) {
                        $r = $i + $j - $n;
                        $m = [$items[$i-1], $items[$j-1]];
                    }
                    if ((($i+$j)%2) == 0) {
                        $tmp = $m;
                        $m[0] = $tmp[1];
                        $m[1] = $tmp[0];
                    }
                }
                if ($j==$n && $i!=$j && $items[$i-1]!=0 && $items[$j-1]!=0) {
                    if ((2*$i) <= $n) {
                        $r = 2 * $i - 1;
                        $m = [$items[$i-1], $items[$j-1]];
                    }
                    if ((2*$i) > $n) {
                        $r = 2 * $i - $n;
                        $m = [$items[$j-1], $items[$i-1]];
                    }
                }
                if ($m) {
                    $cal[$r][] = $m;
                }
            }
        }
        $nc = count($cal);
        $ng = $n+1;
        if (!is_null($schedule)) {
            foreach ($cal as $round => $matchs) {
                foreach($matchs as $i => $dual) {
                    $mat1 = new Match($schema);
                    $mat1->setCompetitionInstance($ci->getId());
                    $mat1->setRound($prefix.$round);
                    $mat1->setTeam1($dual[0]);
                    $mat1->setTeam2($dual[1]);
                    $mat1->setDate($schedule[$round]);
                    $mat1->setType(2);
                    $mat1->setPlayed(0);
                    $mat1->save();

                    if ($homeaway) {
                        $rr = $round + $nc;

                        $mat2 = new Match($schema);
                        $mat2->setCompetitionInstance($ci->getId());
                        $mat2->setRound($prefix.$rr);
                        $mat2->setTeam1($dual[1]);
                        $mat2->setTeam2($dual[0]);
                        $mat2->setDate($schedule[$rr]);
                        $mat2->setType(2);
                        $mat2->setPlayed(0);
                        $mat2->save();
                    }
                }
            }
        }
        return $cal;
    }

    // compute ranking
    public function getRank($schema, $cpi_id, $round = '%', $withoutTeam = '0') {
        $db = new Database;
        $listTeam = [];
        $qualteam = $f = $a = $w = $d = $l = $pts = $diff = [];

        $sql = "
            select t1.tea_name as t1name, t2.tea_name as t2name, * 
            from $schema.mat_match  
            inner join tea_team t1 on t1.tea_id=mat_tea_id__1
            inner join tea_team t2 on t2.tea_id=mat_tea_id__2
            where mat_round like '$round' and mat_cpi_id='$cpi_id'
            and mat_played=true
            and mat_tea_id__1 != $withoutTeam
            and mat_tea_id__2 != $withoutTeam
            order by mat_date asc;
        ";

        $db->query($sql);
        while ($obj = $db->fetch()) {
            //$listTeam[] = array($obj->mat_tea_id__1,$obj->t1name);
            //$listTeam[] = array($obj->mat_tea_id__2,$obj->t2name);
            if (!isset($listTeam[$obj->mat_tea_id__1])) $listTeam[$obj->mat_tea_id__1] = $obj->t1name;
            if (!isset($listTeam[$obj->mat_tea_id__2])) $listTeam[$obj->mat_tea_id__2] = $obj->t2name;

            if (!isset($w[$obj->mat_tea_id__1])) $w[$obj->mat_tea_id__1] = 0;
            if (!isset($d[$obj->mat_tea_id__1])) $d[$obj->mat_tea_id__1] = 0;
            if (!isset($l[$obj->mat_tea_id__1])) $l[$obj->mat_tea_id__1] = 0;
            if (!isset($f[$obj->mat_tea_id__1])) $f[$obj->mat_tea_id__1] = 0;
            if (!isset($a[$obj->mat_tea_id__1])) $a[$obj->mat_tea_id__1] = 0;
            if (!isset($w[$obj->mat_tea_id__2])) $w[$obj->mat_tea_id__2] = 0;
            if (!isset($d[$obj->mat_tea_id__2])) $d[$obj->mat_tea_id__2] = 0;
            if (!isset($l[$obj->mat_tea_id__2])) $l[$obj->mat_tea_id__2] = 0;
            if (!isset($f[$obj->mat_tea_id__2])) $f[$obj->mat_tea_id__2] = 0;
            if (!isset($a[$obj->mat_tea_id__2])) $a[$obj->mat_tea_id__2] = 0;

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
        foreach($listTeam as $tea_id => $tea_name) {
            $clan['tea_id'] = $tea_id;
            $clan['tea_name'] = $tea_name;
            $clan['win'] = $w[$tea_id];
            $clan['draw'] = $d[$tea_id];
            $clan['lose'] = $l[$tea_id];
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

    public function sort($listTeam) {
        for ($i=0;$i<count($listTeam)-1;$i++) {
            for ($j=$i;$j<count($listTeam);$j++) {
                if ($listTeam[$i]['pts'] < $listTeam[$j]['pts'] || $listTeam[$i]['pts'] == $listTeam[$j]['pts'] && $listTeam[$i]['diff'] < $listTeam[$j]['diff']) {
                    $tmp = $listTeam[$i];
                    $listTeam[$i] = $listTeam[$j];
                    $listTeam[$j] = $tmp;
                }
            }
        }
        return $listTeam;
    }
}

/*
$cc = new Championship;
$res = $cc->roundRobin(array(1,2,3,4,5,6));
print_r($res);
*/

