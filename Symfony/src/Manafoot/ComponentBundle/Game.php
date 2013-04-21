<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Entity;
use \Manafoot\ComponentBundle\Database;

class Game extends Entity {

    private $db;

    public function __construct() {
        $this->table = 'gam_game';
        $this->prefix = 'gam_';
        $this->sequence = 'gam_game_gam_id_seq';
        $this->params = array(
        );
        parent::__construct();
        $this->db = new Database;
    }

    public function init() {

        // new instance of game
        $this->insert();
        
        // schema duplication
        $this->duplicateSchema();
    }

    public function destroy() {
	$this->db->dropSchema($this->getName());
    }

    public function duplicateSchema() {
        $this->db->createSchema($this->getName());
        $tables = $this->db->getTables('init');
        foreach($tables as $key => $table) {
            $this->db->copyTable('init.'.$table['tablename'], $this->getName().'.'.$table['tablename']);
        }
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
}


