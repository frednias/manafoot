<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Calendar;
use Manafoot\ComponentBundle\Game;

class NewGameController extends Controller
{
    private $session;

    public function __construct() {
	$this->session = new Session;
    }
    public function NewGameAction()
    {
	// Copy init to $gameName
	$g = new Game;
	$g->init();

	$gameName = $g->getName();
	$this->session->set('gameName', $gameName);

	//$startDate = $g->getFirstDate();
	//$this->session->set('current_date', $startDate);

	// redirect to continue
	
        return $this->redirect("/resume/$gameName");
        return $this->render('ManafootGameBundle:NewGame:NewGame.html.twig', array(
		'startDate' => $startDate,
		'gameName' => $gameName
	));
    }

}
