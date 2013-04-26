<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;

class Event extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct() {
        self::$table = 'evt_event';
        self::$prefix = 'evt_';
        self::$sequence = 'evt_event_evt_id_seq';
        $this->params = array(
        );
        parent::__construct();
    }

    static public function getFirst($schema) {
        $d = new Database;
        $sql = "select * from $schema.evt_event order by evt_date asc limit 1";
        $res = $d->select($sql);
        $e = new self;
        $e->params['evt_date'] = $res[0]->evt_date;
        return $e;
    }
    static public function getNextEvent($schema, $resumeDate, $limit) {
        $eventList = [];
        $sql = "select * from $schema.evt_event where evt_date<='$resumeDate' order by evt_date asc limit $limit";
        $objectList = parent::select($sql);
        foreach ($objectList as $object) {
            $e = new self;
            $e->params['evt_date'] = $object->evt_date;
            $e->params['evt_descr'] = $object->evt_descr;
            $eventList[] = $e;
        }
        return $eventList;
    }

    public function getDate() {
        return $this->params['evt_date'];
    }

    public function setDate($date) {
        $this->params['evt_date'] = $date;
    }

    public function setVisibility($visibility) {
        $this->params['evt_visibility'];
    }

    public function setFunction($function) {
        $this->params['evt_function'] = $function;
    }

    public function setAssociation($ass_id) {
        $this->params['evt_ass_id'] = $ass_id;
    }

    public function getDescr() {
        return $this->params['evt_descr'];
    }

}


