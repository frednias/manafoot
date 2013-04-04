<?php

namespace Manafoot\HomeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpFoundation\Session\Session;

class LoginController extends Controller
{
    private $session;

    public function __construct() {
        $this->session = new Session;
    }
    public function LoginAction()
    {
        if ($_POST['email']=='dev' && $_POST['password']=='dev') {
            $this->session->set('email','dev');
	    return $this->render('ManafootHomeBundle:Login:Dashboard.html.twig', array('name' => 'fred'));
        }
        elseif ($this->session->get('email')=='dev') {
	    return $this->render('ManafootHomeBundle:Login:Dashboard.html.twig', array('name' => 'fred'));
        }
        else {
	    return $this->render('ManafootHomeBundle:Login:Login.html.twig', array('name' => 'fred'));
        }
    }

    public function LogoutAction()
    {
    }

    public function LoginNewUserAction()
    {
    }

    public function PasswordLostAction()
    {
    }

}
