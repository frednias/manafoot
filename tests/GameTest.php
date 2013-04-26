<?php

include __DIR__.'/autoload.php';

use Manafoot\ComponentBundle\Game;
use Manafoot\ComponentBundle\Database;

class GameTest extends PHPUnit_Framework_TestCase
{

    public function testInit()
    {
        $g1 = new Game;
	$g1->init();

        $name1 = $g1->getName();
        $this->assertStringStartsWith('g_', $name1);

        $id1 = substr($name1,2);
	$this->assertTrue( is_numeric($id1));

        $g2 = new Game;
	$g2->init();

        $name2 = $g2->getName();
        $id2 = substr($name2,2);

        $this->assertGreaterThan($id1, $id2);

        $db = new Database;
        $this->assertTrue( $db->schemaExists($name2));

        $this->assertTrue( $db->schemaIsIdentic('init',$name2));

        $g1->destroy();
        $g2->destroy();
        $this->assertFalse($db->schemaExists($name2));
    }
}

