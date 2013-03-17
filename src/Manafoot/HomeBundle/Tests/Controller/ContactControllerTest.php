<?php

namespace Manafoot\HomeBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ContactControllerTest extends WebTestCase
{
    public function testIndex()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/contact/');
    }

    public function testSubmit()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/contact/submit');
    }

}
