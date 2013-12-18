<?php

include __DIR__.'/autoload.php';

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;
use Manafoot\ComponentBundle\Match;
use Manafoot\ComponentBundle\Database;
use Manafoot\ComponentBundle\Championship;

$ch = new Championship;
$rank = $ch->getRank('init', 36941, "g2.%");
$i=1;
foreach ($rank as $r) {
    if ($r['tea_id']==239) $w = 21; else $w=20;
    printf("%02s  %{$w}s %5s  %5s %5s %5s  %5s %5s %5s\n", $i, $r['tea_name'], $r['pts'], $r['win'], $r['draw'], $r['lose'], $r['for'], $r['against'] , $r['diff']);
    $i++;
}

