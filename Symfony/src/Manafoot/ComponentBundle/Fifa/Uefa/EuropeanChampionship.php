<?php

namespace Manafoot\ComponentBundle\Fifa\Uefa;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Competition\Instance;
use \Manafoot\ComponentBundle\Match;
use \Manafoot\ComponentBundle\Flash;
use \Manafoot\ComponentBundle\Championship;
use \Manafoot\ComponentBundle\Cup;
use \Manafoot\ComponentBundle\Team;
use \Manafoot\ComponentBundle\Utils\Range;
use \Manafoot\ComponentBundle\Fifa;


class EuropeanChampionship {

    const CPT_ID = 9;

    // Starting World Cup Qualifications
    // Enters all Afc national team = X {52)
    // exclude world wup host team

    public function start (Game $game, Event $event) {
        $HOST_COUNTRY = array(
            2012 => array('tea_id'=>[90,102], 'host_name'=>'Pologne/Ukraine'),
            2016 => array('tea_id'=>[71], 'host_name'=>'France'),
        );
        $this->setupEnv($game,$event);
        $hostTeamId = implode(',', $HOST_COUNTRY[$this->evt_params->year]['tea_id']);
        $schema = $this->schema;
        $au = new Range;
        $ch = new Championship;

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(self::CPT_ID);
        $data = json_encode(array(
            'year' => $this->evt_params->year,
        ));
        $cpi = $comp->makeInstance($this->evt_params->year,$data);

        //$d->modify("+1 days");
        $d = new \DateTime($event->getDate());
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.ChampionshipQualification.start');
        $e->setVisibility('foreground');
        $e->setDescr("Tirage au sort du tour preliminaire du Championnat d'Europe ".$this->evt_params->year);
        $e->setStatus('todo');
        $e->setParams(json_encode(array(
            'year' => $this->evt_params->year,
            'host_tea_id' => $HOST_COUNTRY[$this->evt_params->year]['tea_id'],
            'master_cpi_id' => $cpi->getId(),
        )));
        $e->save();
    }

    private $db;
    private $schema;
    private $evt_params;
    private $cpi;
    private $cpi_data;
    public function setupEnv($game,$event) {
        $this->db = new Database;
        $this->schema = $game->getName();
        $this->evt_params = json_decode($event->getParams());
        $this->cpi = new Competition\Instance($this->schema);
        if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }
}

/*
$g = new Game;
$g->load('g_8');
$e = new Event('g_8');
$e->load(11);
$w = new WorldCupQualification;
$w->end($g,$e);
*/

