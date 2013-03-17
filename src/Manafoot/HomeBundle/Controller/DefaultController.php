<?php

namespace Manafoot\HomeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('ManafootHomeBundle:Default:index.html.twig', array('name' => $name));
    }
}
