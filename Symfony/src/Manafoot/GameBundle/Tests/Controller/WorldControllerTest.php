<?php

namespace Manafoot\GameBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class WorldControllerTest extends WebTestCase
{
    public function testFifa()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/fifa');
    }

    public function testFifaworldcup()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/fifa/worldCup');
    }

    public function testFifaconcacafworldcupqualification()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/fifa/concacaf/worldCupQualification');
    }

    public function testFifaconcacaf()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/fifa/concacaf');
    }

}
