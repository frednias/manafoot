<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Database;

class Entity {

    private static $dbconn = null;
    private static $db = null;

    private $listKey = array();
    private $listValue = array();

    protected static $table;
    protected static $prefix;
    protected $params;
    protected static $sequence;

    protected $id;

    public function __construct() {
        $listKey = array();
        $listValue = array();
        if (is_null(self::$dbconn)) {
            $conf = parse_ini_file('/etc/manafoot.conf');
            self::$dbconn = pg_connect("port={$conf['port']} dbname={$conf['dbname']} user={$conf['user']} password={$conf['password']}");
        }
        if (is_null(self::$db)) {
            self::$db = new Database;
        }
    }

    public function save() {

        if (!is_null($this->id)) {
            return $this->update();
        }
        else {
            return $this->insert();
        }
    }

    public function insert() {

        $this->listKey = array();
        $this->listValue = array();

        $this->params[static::$prefix.'ins_date'] = 'now()';

        foreach( $this->params as $key => $value) {
		$this->listKey[] = $key;
                $this->listValue[] = $value;
        }
        $keys = implode(',',$this->listKey);
        $values = implode(',',$this->listValue);

        $sql = "insert into ".static::$table." ($keys) values ($values)";
        $ress = pg_query("$sql RETURNING Currval('".static::$sequence."')");
        $fch = pg_fetch_row($ress);
        $last_id = $fch[0];
        $this->id = $last_id;
    }

    public function update() {
        $sql = "update ".static::$table." set ";
        foreach( $this->params as $key => $value) {
            $sql .= "$key = '$value',";
        }
        $sql = substr($sql,0,-1);
        $sql .= " where ".static::$prefix."id = ".$this->id;
        $ress = pg_query($sql);
    }

    public function get($id) {
        $sql = "select * from ".static::$table." where ".static::$prefix."id = $id";
        $ress = pg_query($sql);
        $res = pg_fetch_array($ress,null,PGSQL_ASSOC);
        foreach($res as $key => $value) {
            $this->params[$key] = $value;
        }
        $this->id = $id;
    }

    public function getId() {
        return $this->id;
    }

    public static function select($sql) {
        $ress = self::$db->select($sql);
        return $ress;
    }
}


