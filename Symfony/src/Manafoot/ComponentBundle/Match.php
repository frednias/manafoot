<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Entity;

class Match extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct($schema) {
        self::$table = $schema.'.mat_match';
        self::$prefix = 'mat_';
        self::$sequence = $schema.'.mat_match_mat_id_seq';
        $this->params = array(
        );
        parent::__construct();
    }

    public function getId() {
        return $this->params['evt_id'];
    }

    public function setCompetitionInstance($cpi_id) {
        $this->params['mat_cpi_id'] = $cpi_id;
    }

    public function setRound($round) {
        $this->params['mat_round'] = $round;
    }

    public function setTeam1($tea_id) {
        $this->params['mat_tea_id__1'] = $tea_id;
    }
    public function setTeam2($tea_id) {
        $this->params['mat_tea_id__2'] = $tea_id;
    }

    public function setDate($date) {
        $this->params['mat_date'] = $date;
    }
}


