<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;

class Event extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct($schema) {
        self::$table = $schema.'.evt_event';
        self::$prefix = 'evt_';
        $this->params = array(
        );
        parent::__construct();
    }

    public function getId() {
        return $this->params['evt_id'];
    }

    // Get very first event in database in order to set game starting date
    static public function getFirst($schema) {
        $d = new Database;
        $sql = "select * from $schema.evt_event order by evt_date asc limit 1";
        $res = $d->select($sql);
        $e = new self($schema);
        $e->params['evt_date'] = $res[0]->evt_date;
        return $e;
    }

    public function load($id) {
        $sql = "select * from ".self::$table." where evt_id = $id";
        $obj = $this->select($sql)[0];
        $this->params['evt_date'] = $obj->evt_date;
        $this->params['evt_descr'] = $obj->evt_descr;
        $this->params['evt_function'] = $obj->evt_function;
        $this->params['evt_visibility'] = $obj->evt_visibility;
        $this->params['evt_params'] = $obj->evt_params;
        $this->id = $this->params['evt_id'] = $obj->evt_id;
    }

    // Get next event for a day
    static public function getNext($schema, $resumeDate, $limit) {
        return self::getNextEvent($schema, $resumeDate, $limit);
    }
    static public function getNextEvent($schema, $resumeDate, $limit) {
        $eventList = [];
        $sql = "select * from $schema.evt_event where evt_date='$resumeDate' and evt_status='todo' order by evt_date asc limit $limit";
        $objectList = parent::select($sql);
        foreach ($objectList as $object) {
            $e = new self($schema);
            $e->params['evt_date'] = $object->evt_date;
            $e->params['evt_descr'] = $object->evt_descr;
            $e->params['evt_function'] = $object->evt_function;
            $e->id = $e->params['evt_id'] = $object->evt_id;
            $e->params['evt_visibility'] = $object->evt_visibility;
            $e->params['evt_params'] = $object->evt_params;
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
        $this->params['evt_visibility'] = $visibility;
    }

    public function getFunction() {
        return $this->params['evt_function'];
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
    public function setDescr($descr) {
        $this->params['evt_descr'] = $descr;
    }

    public function setStatus($status) {   
        $this->params['evt_status'] = $status;
    }

    public function getParams() {
        return $this->params['evt_params'];
    }

    public function setParams($params) {
        $this->params['evt_params'] = $params;
    }

}


