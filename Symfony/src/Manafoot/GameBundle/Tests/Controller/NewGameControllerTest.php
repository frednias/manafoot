<?php

namespace Manafoot\GameBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class NewGameControllerTest extends WebTestCase
{
    public function testNewgame()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/game/new');
    }

}
