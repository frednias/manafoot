<?php

namespace Manafoot\ComponentBundle\Competition;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Entity;

class Instance extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct($schema) {
        self::$table = $schema.'.cpi_competition_instance';
        self::$prefix = 'cpi_';
        self::$sequence = $schema.'.cpi_competition_instance_cpi_id_seq';
        $this->params = array(
        );
        parent::__construct();
    }

    public function getId() {
        return $this->id;
    }

    public function setMilesime($milesime) {
        $this->params['cpi_milesime'] = $milesime;
    }

    public function setData($data) {
        $this->params['cpi_data'] = $data;
    }
    public function getData() {
        return $this->params['cpi_data'];
    }

    public function setCompetition($cpt_id) {
        $this->params['cpi_cpt_id'] = $cpt_id;
    }
}


