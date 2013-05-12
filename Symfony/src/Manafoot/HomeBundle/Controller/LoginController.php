<?php

namespace Manafoot\HomeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Database;

class LoginController extends Controller
{
    private $session;

    public function __construct() {
        $this->session = new Session;
    }
    public function LoginAction()
    {
        if (isset($_POST['email']) && $_POST['email']=='dev' && $_POST['password']=='dev') {
            $this->session->set('email','dev');
            return $this->render('ManafootHomeBundle:Login:Dashboard.html.twig', array('games' => $this->getGameList()));
        }
        elseif ($this->session->get('email')=='dev') {
            return $this->render('ManafootHomeBundle:Login:Dashboard.html.twig', array('games' => $this->getGameList()));
        }
        else {
            return $this->render('ManafootHomeBundle:Login:Login.html.twig', array('name' => 'fred'));
        }
    }

    public function getGameList()
    {
        $db = new Database;
        $games = array();

        $sql = "select * from gam_game;";
        $db->query($sql);
        while ($row = $db->fetch()) {
            $games[] = $row->gam_id;
        }

        return $games;
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
