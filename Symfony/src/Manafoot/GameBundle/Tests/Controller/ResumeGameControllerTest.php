<?php

namespace Manafoot\GameBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ResumeGameControllerTest extends WebTestCase
{
    public function testResume()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/resume/{name}');
    }

}
