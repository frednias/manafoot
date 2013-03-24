<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Manafoot\ComponentBundle\Calendar;

class NewGameController extends Controller
{
    public function NewGameAction()
    {
	$calendar = new Calendar;
	$startDate = $calendar->startDate->format('c');

	// TODO : compute ELO ranking for first date

        return $this->render('ManafootGameBundle:NewGame:NewGame.html.twig', array('startDate' => $startDate));
    }

}
