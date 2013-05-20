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
                    $mat1->save();

                    if ($homeaway) {
                        $rr = $round + $nc;

                        $mat2 = new Match($schema);
                        $mat2->setCompetitionInstance($ci->getId());
                        $mat2->setRound($prefix.$rr);
                        $mat2->setTeam1($dual[0]);
                        $mat2->setTeam2($dual[1]);
                        $mat2->setDate($schedule[$rr]);
                        $mat2->setType(2);
                        $mat2->save();
                    }
                }
            }
        }
        return $cal;
    }

}

/*
$cc = new Championship;
$res = $cc->roundRobin(array(1,2,3,4,5,6));
print_r($res);
*/

