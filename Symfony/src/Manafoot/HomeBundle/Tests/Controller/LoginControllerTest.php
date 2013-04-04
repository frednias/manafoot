<?php

namespace Manafoot\HomeBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class LoginControllerTest extends WebTestCase
{
    public function testLogin()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/login');
    }

    public function testLogout()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/logout');
    }

    public function testLoginnewuser()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/login/new');
    }

    public function testPasswordlost()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/login/passwordlost');
    }

}
