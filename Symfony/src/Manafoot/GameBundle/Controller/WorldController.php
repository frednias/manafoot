<?php

namespace Manafoot\GameBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;

use Manafoot\ComponentBundle\Database;
use Manafoot\ComponentBundle\Competition;
use Manafoot\ComponentBundle\Fifa;
use Manafoot\ComponentBundle\Championship;
use Manafoot\ComponentBundle\Cup;

class WorldController extends Controller
{
    private $session;
    private $schema;
    private $db;

    public function __construct()
    {
        $this->session = new Session;
        $this->schema = $this->session->get('gameName');
        $this->db = new Database;
    }

    public function fifaAction()
    {
        $twigParams = [];
        return $this->render('ManafootGameBundle:World:fifa.html.twig', $twigParams);
    }

    public function fifaWorldCupAction()
    {
        $twigParams = [];
        return $this->render('ManafootGameBundle:World:fifaWorldCup.html.twig', $twigParams);
    }
    public function fifaWorldCupEditionAction($edition)
    {
        $cpi = new Competition\Instance($this->schema);
        $cpi->findOne(array(
            'cpi_cpt_id' => 1,
            'cpi_milesime' => $edition,
        ));
        $cpi_data = json_decode($cpi->getData());
print_r($cpi_data);
        $twigParams = [
            'edition' => $edition
        ];
        return $this->render('ManafootGameBundle:World:fifaWorldCupEdition.html.twig', $twigParams);
    }

    public function fifaConcacafWorldCupQualificationAction()
    {
        $twigParams = [];
        return $this->render('ManafootGameBundle:World:fifaConcacafWorldCupQualification.html.twig', $twigParams);
    }

    public function fifaConcacafWorldCupQualificationEditionAction($edition)
    {
        $schema = $this->schema;
        $cpi = new Competition\Instance($this->schema);
        $cpi->findOne(array(
            'cpi_cpt_id' => 2,
            'cpi_milesime' => $edition,
        ));

        // all teams
        $cpi_data = json_decode($cpi->getData());
//print_r($cpi_data);

        // first round
        $sql = "
            select mr.mat_tea_id__1, mr.mat_tea_id__2, mr.mat_score__1 as mr1, mr.mat_score__2 as mr2, mr.mat_tab__1 as tab1, mr.mat_tab__2 as tab2, ma.mat_score__1 as ma1, ma.mat_score__2 as ma2, c1.cou_name as c1name, c2.cou_name as c2name
            from $schema.mat_match mr
            inner join $schema.mar_match_referer on mar_mat_id=mat_id
            inner join $schema.mat_match ma on mar_mat_id__referer=ma.mat_id
            inner join tea_team t1 on t1.tea_id=mr.mat_tea_id__1
            inner join ass_association a1 on a1.ass_id=t1.tea_ass_id
            inner join cou_country c1 on c1.cou_id = a1.ass_cou_id
            inner join tea_team t2 on t2.tea_id=mr.mat_tea_id__2
            inner join ass_association a2 on a2.ass_id=t2.tea_ass_id
            inner join cou_country c2 on c2.cou_id = a2.ass_cou_id
            where mr.mat_cpi_id=".$cpi->getId()." and mr.mat_round='1b';
        ";
        $this->db->query($sql);
        $duals = [];
        while ($obj = $this->db->fetch()) {
            $duals[] = $obj;
        }

        // second round
        $wcq = new Championship;
        $cla2 = [];
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g1%");
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g2%");
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g3%");
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g4%");
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g5%");
        $cla2[] = $wcq->getRank($schema, $cpi->getId(), "2g6%");

        // third round
        $cla3 = [];
        $cla3[] = $wcq->getRank($schema, $cpi->getId(), "3g1%");
        $cla3[] = $wcq->getRank($schema, $cpi->getId(), "3g2%");
        $cla3[] = $wcq->getRank($schema, $cpi->getId(), "3g3%");

        // fourth round
        $cla4 = [];
        $cla4[] = $wcq->getRank($schema, $cpi->getId(), "4%");

        $cla = [ $cla2, $cla3, $cla4 ];

        $twigParams = [
            'edition' => $edition,
            'cpi_data' => $cpi_data,
            'duals' => $duals,
            'cla' => $cla,
        ];
        return $this->render('ManafootGameBundle:World:fifaConcacafWorldCupQualificationEdition.html.twig', $twigParams);
    }

    public function fifaConcacafAction()
    {
        $twigParams = [];
        return $this->render('ManafootGameBundle:World:fifaConcacaf.html.twig', $twigParams);
    }

}
