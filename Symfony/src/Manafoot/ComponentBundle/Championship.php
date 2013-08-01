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

    private $db;
    private $schema;
    private $evt_params;
    private $cpi;
    private $cpi_data;
    public function setupEnv($game,$event) {
        $this->db = new Database;
        $this->schema = $game->getName();
        $this->evt_params = json_decode($event->getParams());
        $this->cpi = new Competition\Instance($this->schema);
        if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }

    // 2010-07-19
    public function createNationalChampionship($game, $event)
    {
        $this->setupEnv($game,$event);
        $d = new \DateTime($event->getDate());

        // for each championship
        $sql = "select * from chi_championship_info";
        $chi = $this->db->select($sql);
        foreach($chi as $key => $cc) {
            $cpt_id = $cc->chi_cpt_id;

            // create cpi
            $comp = new Competition($game->getName());
            $comp->get($cc->chi_cpt_id);
            $year = $this->evt_params->year;
            $cpi_params = json_encode(array(
            ));
            $cpi = $comp->makeInstance($year,$cpi_params);

            // liste teams
            $sql = "select * from init.lk_chp_cpt_tea where chp_cpt_id=$cpt_id";
            $chp = $this->db->select($sql);

            $teams = [];
            foreach($chp as $part) {
                $teams[] = $part->chp_tea_id;
            }

            // get calendar
            $cal = $this->getCalByYear($d->format('Y'));

            // rebase calendar
            $cal = $this->rebaseDate($cal,'2010-07-19', $game->getCycleDate());
            $schedule = array_merge([0],$cal);

            $res = $this->roundRobin($game->getName(), $teams, $cpi, $schedule, $prefix = '', $homeaway = true);
        }
    }

    private function rebaseDate($cal, $refDate, $cycleDate)
    {
        $diffcal = [];
        $d1 = new \DateTime($refDate);
        $d2 = new \DateTime($cycleDate);
        $interval = date_diff($d1,$d2);
        $jdiff = $interval->format('%a');

        foreach ($cal as $jcal) {
            $d = new \DateTime($jcal);
            $d->modify("+$jdiff days");
            $diffcal[] = $d->format('Y-m-d');
        }

        return $diffcal;
    }

    // ref_date = '2010-07-19';
    private function getCalByYear($year)
    {
        $id = $year % 4;
        switch ($id) {
            case 0:
            case 1:
                $cal = array(
                    '2013-08-10'
                );
            case 2:
                $cal = array(
                    '2010-08-07','2010-08-14','2010-08-21','2010-08-28','2010-09-11',
                    '2010-09-18','2010-09-25','2010-10-02','2010-10-16','2010-10-23',
                    '2010-10-30','2010-11-06','2010-11-13','2010-11-20','2010-11-27',
                    '2010-12-04','2010-12-11','2010-12-18','2010-12-22','2011-01-15',
                    '2011-01-29','2011-02-05','2011-02-12','2011-02-19','2011-02-26',
                    '2011-03-05','2011-03-12','2011-03-19','2011-04-02','2011-04-09',
                    '2011-04-16','2011-04-24','2011-04-30','2011-05-07','2011-05-11',
                    '2011-05-15','2011-05-21','2011-05-29'
                );
                break;
            case 3:
        }

        return $cal;
    }

}

/*
$cc = new Championship;
$res = $cc->createNationalChampionship(1,2);
print_r($res);
*/
