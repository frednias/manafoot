<?php

namespace Manafoot\ComponentBundle\Utils;

class Calendar
{
    public function getThirdMondayOfJuly($year)
    {
        $d = new \Datetime($year.'-07-01');
        $n = $d->format('N');
        if ($n!=1) {
            $x = 8 - $n;
            $d->modify("+$x days");
        }
        $d->modify('+14 days');
        return $d;
    }
}


