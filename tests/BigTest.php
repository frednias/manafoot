<?php

include __DIR__.'/autoload.php';

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;
use Manafoot\ComponentBundle\Match;

$game = new Game;
$game->load($argv[1]);
$d = new \DateTime($game->getResumeDate());

while ($d->format('Y-m-d')!='2022-07-31') {


    echo $d->format('Y-m-d')." live...";

    // play matchs
    $w = new Match($game->getName());
    $w->computeAll($game->getResumeDate());
    echo " ok\n";

    // do events
    $events = Event::getNext($game->getName(), $game->getResumeDate(), 1);
    if( count($events)>0) {
        $event = $events[0];
        echo $d->format('Y-m-d')." [".$event->getId()."] ".$event->getDescr()."\n";
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

