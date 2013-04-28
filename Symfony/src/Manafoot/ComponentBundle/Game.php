<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Entity;
use \Manafoot\ComponentBundle\Database;

class Game extends Entity {

    private $db;

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct() {
        self::$table = 'gam_game';
        self::$prefix = 'gam_';
        self::$sequence = 'gam_game_gam_id_seq';
        $this->params = array(
        );
        parent::__construct();
        $this->db = new Database;
    }

    // Start and initialize a new Game
    public function init() {

        // new instance of game
        $this->insert();
        
        // schema duplication
        $this->duplicateSchema();
    }

    // Reload existing Game
    public function load($name) {
        $id = substr($name,2);
        $this->get($id);
    }

    public function destroy() {
	$this->db->dropSchema($this->getName());
    }

    public function duplicateSchema() {
        $this->db->createSchema($this->getName());

        $sql = file_get_contents(__DIR__."/../../../../scripts/init.sql");
        $sql = str_replace('init', $this->getName(), $sql);
        $this->db->query($sql);

        /*
        $tables = $this->db->getTables('init');
        foreach($tables as $key => $table) {
            //$this->db->copyTable('init.'.$table['tablename'], $this->getName().'.'.$table['tablename']);
            $sql = "insert into ".$this->getName().'.'.$table['tablename']. " select * from init.".$table['tablename'];
            $this->db->query($sql);
        }
        */

        $sql = file_get_contents(__DIR__."/../../../../scripts/data_init.sql");
        $sql = str_replace('init', $this->getName(), $sql);
        $this->db->query($sql);
    }

    public function getName() {
	return 'g_'.$this->getId();
    }

    public function getFirstDate() {
    }

    public function createName() {
         return 'g_';
    }

    public function setResumeDate($date) {
        $this->params['gam_resume_date'] = $date;
    }
    public function getResumeDate() {
        return $this->params['gam_resume_date'];
    }
}


