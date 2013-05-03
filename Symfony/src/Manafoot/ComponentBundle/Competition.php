<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;

class Competition extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    private $schema;

    public function __construct($schema) {
        self::$table = 'cpt_competition';
        self::$prefix = 'cpt_';
        self::$sequence = 'cpt_competition_cpt_id_seq';
        $this->params = array(
        );
        parent::__construct();
        $this->schema = $schema;
    }

    public function getId() {
        return $this->params['cpt_id'];
    }

    public function makeInstance($milesime,$data) {
        $ci = new Competition\Instance($this->schema);
        $ci->setCompetition($this->getId());
        $ci->setMilesime($milesime);
        $ci->setData($data);
        $ci->save();
        return $ci;
    }

}


