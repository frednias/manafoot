<?php

namespace Manafoot\GameBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ContinueGameControllerTest extends WebTestCase
{
    public function testContinue()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/continue');
    }

    public function testContinuefast()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/continue/fast');
    }

}
