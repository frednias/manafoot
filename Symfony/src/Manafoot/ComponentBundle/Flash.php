<?php

namespace Manafoot\ComponentBundle;

use \Manafoot\ComponentBundle\Entity;

class Flash extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    public function __construct($schema) {
        self::$table = $schema.'.fla_flash';
        self::$prefix = 'fla_';
        self::$sequence = $schema.'.fla_flash_fla_id_seq';
        $this->params = array(
        );
        parent::__construct();
    }

    public function getId() {
        return $this->params['fla_id'];
    }

    public function setSubject($subject) {
        $this->params['fla_subject'] = $subject;
    }

    public function setBody($body) {
        $this->params['fla_body'] = $body;
    }

    public static function getRecentFlash($schema, $date, $limit)
    {
        $db = new Database;
        $flashList = array();

        $sql = "select * from $schema.fla_flash order by fla_id desc limit $limit";
        $db->query($sql);
        while ($row = $db->fetch()) {
            $flashList[] = $row;
        }

        return $flashList;
    }

}


