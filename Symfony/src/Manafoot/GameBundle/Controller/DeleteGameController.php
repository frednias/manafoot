<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Event;
use Manafoot\ComponentBundle\Flash;

class DeleteGameController extends Controller
{
    private $session;

    public function __construct() {
        $this->session = new Session;
    }
    public function deleteAction($name)
    {
        $g = new Game;
        $g->load($name);

        $g->end();

        return $this->redirect('/login');
    }

    public function getRecentFlash()
    {
    }
}
