<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Entity;

class Team extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct() {
        self::$table = 'tea_team';
        self::$prefix = 'tea_';
        self::$sequence = 'tea_team_tea_id_seq';
        $this->params = array(
        );
        parent::__construct();
    }

    public function getId() {
        return $this->params['tea_id'];
    }

    public function getName() {
        return $this->params['tea_name'];
    }

}


