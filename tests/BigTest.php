<?php

include __DIR__.'/autoload.php';

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;
use Manafoot\ComponentBundle\Match;
use Manafoot\ComponentBundle\Database;
use Manafoot\ComponentBundle\Championship;

$game = new Game;
$game->load($argv[1]);
$d = new \DateTime($game->getResumeDate());

while ($d->format('Y-m-d')!='2011-05-31') {


    //echo $d->format('Y-m-d')." live...";

    // play matchs
    $w = new Match($game->getName());
    $w->computeAll($game->getResumeDate());
    //echo " ok\n";

    // do events
    $events = Event::getNext($game->getName(), $game->getResumeDate(), 1);
    if( count($events)>0) {
        $event = $events[0];
        //echo $d->format('Y-m-d')." [".$event->getId()."] ".$event->getDescr()."\n";
        $parts = preg_split('/\./', $event->getFunction());
        $function = array_pop($parts);
        $class = "\Manafoot\ComponentBundle\\".implode("\\", $parts);

        (new $class)->$function($game, $event);

        $event->setStatus('ok');
        $event->save();
    }
    else {
        $d->modify('+1 day');
        $game->setResumeDate($d->format('Y-m-d'));
        $game->save();
    }
}

$sql = "select * from ".$argv[1].".cpi_competition_instance where cpi_cpt_id=11";
$db = new Database;
$db->query($sql);
$c = $db->fetch();

$ch = new Championship;
$rank = $ch->getRank($argv[1], $c->cpi_id, "%");
$i=1;
foreach ($rank as $r) {
    if ($r['tea_id']==239) $w = 21; else $w=20;
    printf("%02s  %{$w}s %5s  %5s %5s %5s  %5s %5s %5s\n", $i, $r['tea_name'], $r['pts'], $r['win'], $r['draw'], $r['lose'], $r['for'], $r['against'] , $r['diff']);
    $i++;
}

