<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Match;

class ContinueGameController extends Controller
{

    private $session;

    public function __construct() {
        $this->session = new Session;
    }

    public function continueAction()
    {
        $game = new Game;
        $game->load($this->session->get('gameName'));

        $events = Event::getNext($this->session->get('gameName'), $this->session->get('resumeDate'), 1);
        if( count($events)>0) {
            $event = $events[0];
            $parts = preg_split('/\./', $event->getFunction());
            $function = array_pop($parts);
            $class = "\Manafoot\ComponentBundle\\".implode("\\", $parts);

            (new $class)->$function($game, $event);

            $event->setStatus('ok');
            $event->save();

            $twigParams = array(
                'resumeDate' => $this->session->get('resumeDate'),
            );
            return $this->redirect('/resume/'.$game->getName());
            return $this->render('ManafootGameBundle:ContinueGame:continue.html.twig', $twigParams);
        }
        else {
            // play matchs
            $w = new Match($game->getName());
            $w->computeAll($game->getResumeDate());

            $d = new \DateTime($this->session->get('resumeDate'));
            $d->modify('+1 day');
            $game->setResumeDate($d->format('Y-m-d'));
            $game->save();
            return $this->redirect('/resume/'.$game->getName());
        }
    }

    public function continueFastAction()
    {
    }

}
