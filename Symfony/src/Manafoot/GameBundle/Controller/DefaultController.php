<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('ManafootGameBundle:Default:index.html.twig', array('name' => $name));
    }
}
