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

    public function end() {
        $this->destroy();
        $id = $this->getId();
        $sql = "delete from gam_game where gam_id = $id";
        $this->db->query($sql);
    }

    public function duplicateSchema() {
        $this->db->createSchema($this->getName());

        /*
        $sql = file_get_contents(__DIR__."/../../../../scripts/init.sql");
        $sql = str_replace('init', $this->getName(), $sql);
        $this->db->query($sql);

        $sql = file_get_contents(__DIR__."/../../../../scripts/data_init.sql");
        $sql = str_replace('init', $this->getName(), $sql);
        $this->db->query($sql);
        */

        $s = "select * from pg_tables where schemaname='init';";
        $tables = $this->db->getTables('init');
        foreach($tables as $key => $table) {
            $this->db->copyTable('init.'.$table['tablename'], $this->getName().'.'.$table['tablename']);
            $sql = "insert into ".$this->getName().'.'.$table['tablename']. " select * from init.".$table['tablename'];
            $this->db->query($sql);
        }

    }
    public function startingEvents($game, $event) // 2010-07-19
    {
        $schema = $game->getName();

        $game->setCycleDate($event->getDate());
        $game->save();

        $d = new \DateTime($event->getDate());
        $year = $d->format('Y');
        $toYear = 1 + $year;
        $yearCdm = 4 + $year;
        $yearEuro = 2 + $year;

        // tomorrow
        $dp1 = new \DateTime($event->getDate());
        $dp1->modify('+1 day');

        $events = array(
            array(
                'descr' => "Preparation de la Coupe du monde de football $yearCdm",
                'date' => $event->getDate(),
                'function' => 'Fifa.WorldCup.start',
                'params' => '{"year":2014}',
                'ass_id' => 1,
            ),
            array(
                'descr' => "Preparation du Championnat d\'Europe de football $yearEuro",
                'date' => $dp1->format('Y-m-d'),
                'function' => 'Fifa.Uefa.EuropeanChampionship.start',
                'params' => '{"year":2012}',
                'ass_id' => 11,
            ),
            array(
                'descr' => 'Creation des championats nationaux',
                'date' => $event->getDate(),
                'function' => 'Championship.createNationalChampionship',
                'params' => '{"year":"'.$year.'-'.$toYear.'"}',
                'ass_id' => 1,
            ),
        );
        foreach ($events as $event) {
            $descr = pg_escape_literal($event['descr']);
            $sql = "
                insert into $schema.evt_event
                    (  
                        evt_ins_date,
                        evt_date,
                        evt_descr,
                        evt_ass_id,
                        evt_function,
                        evt_params,
                        evt_visibility,
                        evt_status
                    )
                values
                    (
                        now(),
                        '{$event['date']}',
                        $descr,
                        {$event['ass_id']},
                        '{$event['function']}',
                        '{$event['params']}',
                        'background',
                        'todo'
                    )
            ";
            $this->db->query($sql);
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
    public function getResumeDate() {
        return $this->params['gam_resume_date'];
    }

    public function setCycleDate($cycleDate)
    {
        $this->params['gam_cycle_date'] = $cycleDate;
    }

    public function getCycleDate()
    {
        return $this->params['gam_cycle_date'];
    }
}


