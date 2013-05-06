<?php

namespace Manafoot\ComponentBundle;

//require('../../../../tests/autoload.php');
use \Manafoot\ComponentBundle\Entity;
use \Manafoot\ComponentBundle\Database;

class Championship {

    public function roundRobin($schema, $items, $ci, $schedule = null, $prefix = '') {
        $n = count($items);
        $cal = [];
        for($i=1;$i<=$n;$i++) {
            for($j=$i;$j<=$n;$j++) {
                $m = null;
                if ($j!=$n && $i!=$n && $i!=$j) {
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
                if ($j==$n && $i!=$j) {
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
        foreach ($cal as $round => $matchs) {
            $mat1 = new Match($schema);
            $mat1->setCompetitionInstance($ci->getId());
            $mat1->setRound($prefix.$round);
            $mat1->setTeam1($matchs[0][0]);
            $mat1->setTeam2($matchs[0][1]);
            $mat1->setDate($schedule[$round]);
            $mat1->setType(2);
            $mat1->save();

            $mat2 = new Match($schema);
            $mat2->setCompetitionInstance($ci->getId());
            $mat2->setRound($prefix.$round);
            $mat2->setTeam1($matchs[1][0]);
            $mat2->setTeam2($matchs[1][1]);
            $mat2->setDate($schedule[$round]);
            $mat2->setType(2);
            $mat2->save();

            $rr = $round + $nc;

            $matr1 = new Match($schema);
            $matr1->setCompetitionInstance($ci->getId());
            $matr1->setRound($prefix.$rr);
            $matr1->setTeam1($matchs[0][1]);
            $matr1->setTeam2($matchs[0][0]);
            $matr1->setDate($schedule[$rr]);
            $matr1->setType(2);
            $matr1->save();

            $matr2 = new Match($schema);
            $matr2->setCompetitionInstance($ci->getId());
            $matr2->setRound($prefix.$rr);
            $matr2->setTeam1($matchs[1][1]);
            $matr2->setTeam2($matchs[1][0]);
            $matr2->setDate($schedule[$rr]);
            $matr2->setType(2);
            $matr2->save();
        }

        return $cal;
    }

}

/*
$cc = new Championship;
$res = $cc->roundRobin(array(1,2,3,4,5,6));
print_r($res);
*/

