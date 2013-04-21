<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;

class Event extends Entity {

    private $db;

    public function __construct() {
        $this->table = 'evt_event';
        $this->prefix = 'evt_';
        $this->sequence = 'evt_event_evt_id_seq';
        $this->params = array(
        );
        parent::__construct();
        $this->db = new Database;
    }

    static public function getFirst($schema) {
	$d = new Database;
	$sql = "select * from $schema.evt_event order by evt_date asc limit 1";
	$res = $d->select($sql);
	$e = new self;
	$e->evt_date = $res->evt_date;
	return $e;
    }

    public function getDate() {
        return $this->evt_date;
    }
}


