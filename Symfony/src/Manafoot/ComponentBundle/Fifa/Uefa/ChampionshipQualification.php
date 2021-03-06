<?php

namespace Manafoot\ComponentBundle\Fifa\Uefa;

//require "/home/www/manafoot.com/tests/autoload.php";

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Competition;
use \Manafoot\ComponentBundle\Competition\Instance;
use \Manafoot\ComponentBundle\Match;
use \Manafoot\ComponentBundle\Flash;
use \Manafoot\ComponentBundle\Championship;
use \Manafoot\ComponentBundle\Cup;
use \Manafoot\ComponentBundle\Team;
use \Manafoot\ComponentBundle\Utils\Range;
use \Manafoot\ComponentBundle\Fifa;

/*
TODO :
    improve best second calculating
*/

class ChampionshipQualification {

    const CPT_ID = 10;

    // Starting World Cup Qualifications
    // Enters all Afc national team = X {52)
    // exclude world wup host team

    public function start (Game $game, Event $event) {
        $this->setupEnv($game,$event);
        $hostTeamId = implode(',',$this->evt_params->host_tea_id);
        $schema = $this->schema;
        $au = new Range;
        $ch = new Championship;

        // find and sort available team by elo points
        $sql = "
            SELECT elh_tea_id,cou_name,elh_points 
            FROM ass_association 
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=11) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            AND elh_tea_id not in ($hostTeamId)
            order by elh_points desc
        ";
        $this->db->query($sql);
        $teams = [];
        while ($obj = $this->db->fetch()) {
            $teams[] = $obj->elh_tea_id; 
        }

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(self::CPT_ID);
        $data = json_encode(array(
            'teams' => $teams,
            'master_cpi_id' => $this->evt_params->master_cpi_id,
        ));
        $cpi = $comp->makeInstance($this->evt_params->year,$data);
        $n = count($teams); // 51 or 52
        $pot1 = $au->subRange($teams,0,8);
        $pot2 = $au->subRange($teams,9,17);
        $pot3 = $au->subRange($teams,18,26);
        $pot4 = $au->subRange($teams,27,35);
        $pot5 = $au->subRange($teams,36,44);
        $pot6 = $au->subRange($teams,45,53);

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2010-07-20
        $precDate = '2010-07-20';
        $scheduleDate = ['2010-09-03', '2010-09-07', '2010-10-08', '2010-10-12', '2011-03-26', '2011-06-04', '2011-09-02', '2011-09-06', '2011-10-07', '2011-10-11'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }

        for($i=1; $i<=9; $i++) {
            $gr = [];
            $gr[] = array_pop($pot1);
            $gr[] = array_pop($pot2);
            $gr[] = array_pop($pot3);
            $gr[] = array_pop($pot4);
            $gr[] = array_pop($pot5);
            $gr[] = array_pop($pot6);
            $cal = $ch->roundRobin($schema, $gr, $cpi, $schedule, "1g$i.", true);
        }
        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.ChampionshipQualification.barrage');
        $e->setVisibility('foreground');
       $e->setDescr("Tirage au sort des barrages pour l'Euro ".$cpi->getMilesime());
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$cpi->getId().'}');
        $e->save();
    }

    public function barrage($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;
        $r = new Range;

        $quals = [];
        $second = [];
        for($i=1; $i<=9; $i++) {
            $rank = $ch->getRank($this->schema, $this->cpi->getId(), "1g$i%");
            $quals[] = $rank[0]['tea_id'];
            $bar_tea_id = $rank[1]['tea_id'];
            $n = count($rank);
            if ($n==6) {
                $last = $rank[5]['tea_id'];
                $rankwt = $ch->getRank($this->schema, $this->cpi->getId(), "1g$i%", $last); // exclude last team
                foreach ($rankwt as $rk) {
                    if ($rk['tea_id']==$bar_tea_id) {
                        $second[] = $rk;
                    }
                }
            }
            else {
                $second[] = $rank[1];
            }
        }
        $second = $ch->sort($second);
        $quals[] = $second[0]['tea_id'];
        $pot1 = $pot2 = [];
        for ($i=1; $i<5; $i++) {
            $pot1[] = $second[$i]['tea_id'];
        }
        for ($i=5; $i<9; $i++) {
            $pot2[] = $second[$i]['tea_id'];
        }

        $d = new \DateTime($event->getDate()); // 2011-10-12
        $d->modify("+30 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+4 days");
        $date2 = $d->format('Y-m-d');

        $cup->setHomeAwayMatch($game,$this->cpi->getId(),'2a','2b',$pot1,$pot2,$date1,$date2);

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(11);
        $e->setFunction('Fifa.Uefa.ChampionshipQualification.end');
        $e->setVisibility('foreground');
        $e->setDescr("Fin du tour preliminaire de l'Euro");
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();

        $li = '';
        foreach($quals as $tea_id) {
            $team = new Team($this->schema);
            $team->get($tea_id);
            $li .= "<li>".$team->getName()."</li>";
        }
        $fla = new Flash($this->schema);
        $fla->setSubject("Qualifications des équipes européennes pour l'Euro");
        $fla->setBody("<p>Les équipes suivantes, terminant 1ere de leur groupe, se sont qualifiés pour l'Euro :
                        <ul>
                            $li
                        </ul>");
        $fla->save();

        $wc = new Fifa\Uefa\EuropeanChampionship;
        $wc->addQualifiedTeams($this->schema, $this->cpi_data->master_cpi_id,11,$quals);
    }

    private $db;
    private $schema;
    private $evt_params;
    private $cpi;
    private $cpi_data;
    public function setupEnv($game,$event) {
        $this->db = new Database;
        $this->schema = $game->getName();
        $this->evt_params = json_decode($event->getParams());
        $this->cpi = new Competition\Instance($this->schema);
        if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }

    public function end($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;

        $qualTeams = $cup->getQualifiedTeams($game, $this->cpi->getId(), '2b');

        $li = '';
        foreach($qualTeams as $tea_id) {
            $team = new Team($this->schema);
            $team->get($tea_id);
            $li .= "<li>".$team->getName()."</li>";
        }
        $fla = new Flash($this->schema);
        $fla->setSubject("Qualifications des équipes européennes pour l'Euro");
        $fla->setBody("<p>Les équipes suivantes se sont qualifiés pour l'Euro, à l'issue des barrages :
                        <ul>
                            $li
                        </ul>");
        $fla->save();

        $wc = new Fifa\Uefa\EuropeanChampionship;
        $wc->addQualifiedTeams($this->schema, $this->cpi_data->master_cpi_id,11,$qualTeams);
    }

}

/*
$g = new Game;
$g->load('g_29');
$e = new Event('g_29');
$e->load(37);
$w = new ChampionshipQualification;
$w->end($g,$e);
*/
