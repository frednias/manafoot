<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;
use Manafoot\ComponentBundle\Flash;
use Manafoot\ComponentBundle\Match;

class ResumeGameController extends Controller
{
    private $session;

    public function __construct() {
        $this->session = new Session;
    }
    public function resumeAction($name)
    {
        $g = new Game;
        $g->load($name);

        $this->session->set('gameName', $g->getName());
        $this->session->set('schema', $g->getName());

        $resumeDate = $g->getResumeDate();
        $this->session->set('resumeDate', $resumeDate);

        $eventList = Event::getNextEvent($g->getName(), $resumeDate, $limit=5);

        $flashList = Flash::getRecentFlash($g->getName(), $resumeDate, $limit=10);

        $matchList = Match::getNextScheduledMatch($g->getName(), $resumeDate, $limit=15);

        $twigParams = array(
            'events' => $eventList,
            'date' => $resumeDate,
            'flashs' => $flashList,
            'matchs' => $matchList,
        );
        return $this->render('ManafootGameBundle:ResumeGame:resume.html.twig', $twigParams);
    }

    public function getRecentFlash()
    {
    }
}
