<?php

namespace Manafoot\ComponentBundle;

class Database {

    private static $dbconn;

    public function __construct() {
        if (is_null(self::$dbconn)) {
            $conf = parse_ini_file('/etc/manafoot.conf');
            self::$dbconn = pg_connect("port={$conf['port']} dbname={$conf['dbname']} user={$conf['user']} password={$conf['password']}");
        }
    }

    public function select($sql) {
        $ret = [];
        $ress = pg_query($sql);
        $n = pg_num_rows($ress);
        while ($obj = pg_fetch_object($ress)) {
            $ret[] = $obj;
        }
        return $ret;
    }

    // Other queries, no treatment
    public function query($sql) {
        pg_query($sql);
    }

    public function schemaExists($name) {
        $sql = "select * from pg_namespace where nspname='$name'";
        $res = pg_query($sql);
        $nb = pg_num_rows($res);
        return $nb>0;
    }

    public function createSchema($name) {
        pg_query("CREATE SCHEMA $name");
    }

    public function dropSchema($name) {
        pg_query("DROP SCHEMA $name CASCADE");
    }

    public function schemaIsIdentic($name1,$name2) {
        $sql1 = "select tablename from pg_tables where schemaname='$name1'";
        $res1 = pg_query($sql1);
        $data1 = pg_fetch_all($res1);
        $sql2 = "select tablename from pg_tables where schemaname='$name2'";
        $res2 = pg_query($sql2);
        $data2 = pg_fetch_all($res2);
        return $data1 == $data2;
    }

    public function getTables($schema) {
	$sql = "select tablename from pg_tables where schemaname='$schema'";
        $res = pg_query($sql);
        return pg_fetch_all($res);
    }

    public function copyTable($fromTable,$toTable) {
	$sql = "create table $toTable as table $fromTable";
        pg_query($sql);
    }
}

