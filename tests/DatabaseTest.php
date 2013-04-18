<?php

include __DIR__.'/autoload.php';

use Manafoot\ComponentBundle\Database;

class DatabaseTest extends PHPUnit_Framework_TestCase
{

    public function testSchema() {
        $db = new Database;
        $this->assertFalse($db->schemaExists('schema1'));
	$db->createSchema('schema1');
        $this->assertTrue($db->schemaExists('schema1'));
        $db->dropSchema('schema1');
        $this->assertFalse($db->schemaExists('schema1'));
    }
}

