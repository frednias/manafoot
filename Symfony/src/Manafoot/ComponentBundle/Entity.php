<?php

namespace Manafoot\ComponentBundle;

class Entity {

    private static $dbconn = null;

    private $listKey = array();
    private $listValue = array();

    protected $table;
    protected $prefix;
    protected $params;
    protected $sequence;

    protected $id;

    public function __construct() {
        $listKey = array();
        $listValue = array();
        if (is_null(self::$dbconn)) {
            $conf = parse_ini_file('/etc/manafoot.conf');
            self::$dbconn = pg_connect("port={$conf['port']} dbname={$conf['dbname']} user={$conf['user']} password={$conf['password']}");
        }
    }

    public function insert() {

        $this->listKey = array();
        $this->listValue = array();

        $this->params[$this->prefix.'ins_date'] = 'now()';

        foreach( $this->params as $key => $value) {
		$this->listKey[] = $key;
                $this->listValue[] = $value;
        }
        $keys = implode(',',$this->listKey);
	$values = implode(',',$this->listValue);

        $sql = "insert into {$this->table} ($keys) values ($values)";
        $ress = pg_query("$sql RETURNING Currval('{$this->sequence}')");
        $fch = pg_fetch_row($ress);
        $last_id = $fch[0];
        $this->id = $last_id;
    }

    public function update() {
        $sql = "update {$this->table} set ";
        foreach( $this->params as $key => $value) {
            $sql .= "$key = '$value',";
        }
        $sql = substr($sql,0,-1);
        $sql .= " where ".$this->prefix."id = ".$this->id;
        $ress = pg_query($sql);
    }

    public function getId() {
        return $this->id;
    }

}


