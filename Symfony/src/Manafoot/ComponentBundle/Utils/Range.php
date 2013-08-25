<?php

namespace Manafoot\ComponentBundle\Utils;

class Range
{

    // from start to end, included
    public function subRange($array, $start, $end) {
        $ret = [];
        for ($i=$start; $i<=$end; $i++) {
            if (isset($array[$i])) {
                $ret[] = $array[$i];
            }
        }
        return $ret;
    }

    public function intersect($array1, $array2) {
        $ret = [];

        foreach($array1 as $key => $value) {
            if (in_array($value, $array2)) {
                $ret[] = $value;
            }
        }

        return $ret;
    }

}


