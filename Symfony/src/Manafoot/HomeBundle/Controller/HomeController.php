<?php

namespace Manafoot\HomeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HomeController extends Controller
{
    public function IndexAction()
    {
        return $this->render('ManafootHomeBundle:Home:Index.html.twig', array('name' => 'fred'));
    }

}
