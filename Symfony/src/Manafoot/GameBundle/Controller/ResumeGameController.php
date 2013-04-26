<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;

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

        $eventList = Event::getNextEvent($g->getName(), $resumeDate, $limit=5);

        return $this->render('ManafootGameBundle:ResumeGame:resume.html.twig', array('events' => $eventList));
    }
}
