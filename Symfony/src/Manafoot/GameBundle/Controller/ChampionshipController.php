<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Database;
use Manafoot\ComponentBundle\Championship;

class ChampionshipController extends Controller
{
    private $session;
    private $schema;
    private $db;

    public function __construct()
    {
        $this->session = new Session;
        $this->schema = $this->session->get('gameName');
        $this->db = new Database;
    }

    public function championshipAction($cpi_id)
    {
        $ch = new Championship;
        $rank = $ch->getRank($this->schema, $cpi_id, "%");

        return $this->render('ManafootGameBundle:Championship:championship.html.twig', array(
            'cpi_id' => $cpi_id,
            'rank' => $rank,
        ));
    }
}
