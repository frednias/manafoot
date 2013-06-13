<?php

namespace Manafoot\ComponentBundle;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Match;
use \Manafoot\ComponentBundle\Team;

class Cup {

    public function getQualifiedNeutralMatch($schema, $cpi_id, $round) {
        $db = new Database;

        // find qualified teams

        $sql = "
            select mr.mat_tea_id__1, mr.mat_tea_id__2, mr.mat_score__1 as mr1, mr.mat_score__2 as mr2, mr.mat_tab__1, mr.mat_tab__2
            from $schema.mat_match mr 
            where mr.mat_cpi_id={$cpi_id} and mr.mat_round like '{$round}%'
            order by mat_round asc;
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            if ($obj->mr1 > $obj->mr2) {
                $qualTeams[] = $obj->mat_tea_id__1;
            }
            else if ($obj->mr2 > $obj->mr1) {
                $qualTeams[] = $obj->mat_tea_id__2;
            }
            else if ($obj->mat_tab__1 > $obj->mat_tab__2) {
                $qualTeams[] = $obj->mat_tea_id__1;
            }
            else {
                $qualTeams[] = $obj->mat_tea_id__2;
            }
        }

        return $qualTeams;
    }
    public function getQualifiedTeams($game, $cpi_id, $round) {
        $db = new Database;
        $schema = $game->getName();

        // find qualified teams

        $sql = "
            select mr.mat_tea_id__1, mr.mat_tea_id__2, mr.mat_score__1 as mr1, mr.mat_score__2 as mr2, mr.mat_tab__1, mr.mat_tab__2, ma.mat_score__1 as ma1, ma.mat_score__2 as ma2 
            from $schema.mat_match mr 
            inner join $schema.mar_match_referer on mar_mat_id=mat_id 
            inner join $schema.mat_match ma on mar_mat_id__referer=ma.mat_id  
            where mr.mat_cpi_id={$cpi_id} and mr.mat_round='{$round}';
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $total1 = $obj->mr1 + $obj->ma2;
            $total2 = $obj->mr2 + $obj->ma1;
            if ($total1 > $total2) {
                $qualTeams[] = $obj->mat_tea_id__1;
            }
            else if ($total2 > $total1) {
                $qualTeams[] =  $obj->mat_tea_id__2;
            }
            else if ($obj->mr2 > $obj->ma2) {
                $qualTeams[] = $obj->mat_tea_id__2;
            }
            else if ($obj->ma2 > $obj->mr2) {
                $qualTeams[] = $obj->mat_tea_id__1;
            }
            else if ($obj->mat_tab__1 > $obj->mat_tab__2) {
                $qualTeams[] = $obj->mat_tea_id__1;
            }
            else if ($obj->mat_tab__2 > $obj->mat_tab__1) {
                $qualTeams[] = $obj->mat_tea_id__2;
            }
            else {
                //cas impossible
            }
        }

        return $qualTeams;
    }

    public function setNeutralMatch($schema,$cpi_id,$round1,$tea_id_1,$tea_id_2,$date1) {
            $mat1 = new Match($schema);
            $mat1->setCompetitionInstance($cpi_id);
            $mat1->setRound($round1);
            $mat1->setTeam1($tea_id_1);
            $mat1->setTeam2($tea_id_2);
            $mat1->setDate($date1);
            $mat1->setType(3);
            $mat1->setPlayed(0);
            $mat1->save();
    }
    public function setHomeAwayMatch($game,$cpi_id,$round1,$round2,$pot1,$pot2,$date1,$date2) {

        shuffle($pot1);
        shuffle($pot2);

        $n = count($pot1);
        for ($i=0; $i<$n; $i++) {
            $t1 = array_pop($pot1);
            $t2 = array_pop($pot2);

            $mat1 = new Match($game->getName());
            $mat1->setCompetitionInstance($cpi_id);
            $mat1->setRound($round1);
            $mat1->setTeam1($t1);
            $mat1->setTeam2($t2);
            $mat1->setDate($date1);
            $mat1->setType(4);
            $mat1->setPlayed(0);
            $mat1->save();

            $mat2 = new Match($game->getName());
            $mat2->setCompetitionInstance($cpi_id);
            $mat2->setRound($round2);
            $mat2->setTeam1($t2);
            $mat2->setTeam2($t1);
            $mat2->setDate($date2);
            $mat2->setType(5);
            $mat2->setPlayed(0);
            $mat2->save();
            $mat2->setMatchReferer($mat1->getId());
        }
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

