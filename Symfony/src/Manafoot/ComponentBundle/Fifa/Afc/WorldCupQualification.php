<?php

namespace Manafoot\ComponentBundle\Fifa\Afc;

require "/home/www/manafoot.com/tests/autoload.php";

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

class WorldCupQualification {

    const CPT_ID = 5;

    // Starting World Cup Qualifications
    // Enters all Afc national team = X (10 or 11)
    // exclude world wup host team
    // half round robin for 4 last teams

    public function start (Game $game, Event $event) {
        $db = new Database;
        $schema = $game->getName();
        $evtId = $event->getId();
        $teams = array();
        $params = json_decode($event->getParams());
        $hostTeamId = $params->host_tea_id;


        // find and sort available team by elo points
        $sql = "
            SELECT elh_tea_id,cou_name,elh_points 
            FROM ass_association 
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=13) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            AND elh_tea_id<>$hostTeamId
            order by elh_points desc
        ";
        $db->query($sql);
        while ($obj = $db->fetch()) {
            $teams[] = $obj->elh_tea_id; 
        }

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);
        $data = json_encode(array(
            'teams' => $teams,
            'master_cpi_id' => $params->master_ci_id,
        ));
        $cpi = $comp->makeInstance($params->year,$data);

        $n = count($teams); // 45 or 46, TODO should be 42-43 in the futur
        // want to save 35 teams
        $pot1 = [];
        $pot2 = [];
        for($i=$n-($n-35)*2; $i<35; $i++) {
            $pot1[] = $teams[$i];
            $pot2[] = $teams[$i+$n-35];
        }

        shuffle($pot1);
        shuffle($pot2);

        $n = count($pot1);
        for ($i=0; $i<$n; $i++) {
            $t1 = array_pop($pot1);
            $t2 = array_pop($pot2);

            $d1 = new \DateTime($event->getDate());
            $d1->modify("+91 days");
            $d2 = new \DateTime($event->getDate());
            $d2->modify("+95 days");
            
            $mat1 = new Match($schema);
            $mat1->setCompetitionInstance($cpi->getId());
            $mat1->setRound('1a');
            $mat1->setTeam1($t1);
            $mat1->setTeam2($t2);
            $mat1->setDate($d1->format('Y-m-d'));
            $mat1->setType(4);
            $mat1->setPlayed(0);
            $mat1->save();

            $mat2 = new Match($schema);
            $mat2->setCompetitionInstance($cpi->getId());
            $mat2->setRound('1b');
            $mat2->setTeam1($t2);
            $mat2->setTeam2($t1);
            $mat2->setDate($d2->format('Y-m-d'));
            $mat2->setType(5);
            $mat2->setPlayed(0);
            $mat2->save();
            $mat2->setMatchReferer($mat1->getId());
        }

        $d = new \DateTime($event->getDate());

        $d->modify("+96 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.round2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour preliminaire de la Coupe du Monde, zone Asie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$cpi->getId().'}');
        $e->save();
    }

    public function round2($game,$event) {
        $db = new Database;
        $schema = $game->getName();
        $evtId = $event->getId();
        $teams = array();
        $params = json_decode($event->getParams());
        $cup = new Cup;
        $cpi = new Competition\Instance($schema);
        $cpi->get($params->cpi_id);
        $cpi_data = json_decode($cpi->getData());

        $qualTeams = $cup->getQualifiedTeams($game, $params->cpi_id, '1b');


        $pot1 = [];
        $pot2 = [];
        for ($i=5; $i<20; $i++) {
            $pot1[] = $cpi_data->teams[$i];
        }
        for ($i=20; $i<35-count($qualTeams); $i++) {
            $pot2[] = $cpi_data->teams[$i];
        }
        $pot2 = array_merge($pot2,$qualTeams);

        $d = new \DateTime($event->getDate()); // 2011-07-04
        $d->modify("+19 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+5 days");
        $date2 = $d->format('Y-m-d');
        $cup->setHomeAwayMatch($game,$cpi->getId(),'2a','2b',$pot1,$pot2,$date1,$date2);

        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.round3');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 3e tour preliminaire de la Coupe du Monde, zone Asie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$cpi->getId().'}');
        $e->save();
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
        $this->cpi->get($this->evt_params->cpi_id);
        $this->cpi_data = json_decode($this->cpi->getData());
    }

    public function round3($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;
        $au = new Range;
        $qualTeams = $cup->getQualifiedTeams($game, $this->evt_params->cpi_id, '2b');
        $qualTeams = $au->intersect($this->cpi_data->teams, $qualTeams);
        $pot1 = $au->subRange($this->cpi_data->teams,0,4);
        $pot2 = $au->subRange($qualTeams,0,4);
        $pot3 = $au->subRange($qualTeams,5,9);
        $pot4 = $au->subRange($qualTeams,10,14);
        shuffle($pot1);
        shuffle($pot2);
        shuffle($pot3);
        shuffle($pot4);
        $gr1 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
        $gr2 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
        $gr3 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
        $gr4 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
        $gr5 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2011-07-29
        $precDate = '2011-07-29';
        $scheduleDate = ['2011-09-02', '2011-09-06', '2011-10-11', '2011-11-11', '2011-11-15', '2012-02-29'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }
        $cal = $ch->roundRobin($this->schema, $gr1, $this->cpi, $schedule, "3g1.", true);
        $cal = $ch->roundRobin($this->schema, $gr2, $this->cpi, $schedule, "3g2.", true);
        $cal = $ch->roundRobin($this->schema, $gr3, $this->cpi, $schedule, "3g3.", true);
        $cal = $ch->roundRobin($this->schema, $gr4, $this->cpi, $schedule, "3g4.", true);
        $cal = $ch->roundRobin($this->schema, $gr5, $this->cpi, $schedule, "3g5.", true);

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.round4');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 4e tour preliminaire de la Coupe du Monde, zone Asie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function round4($game,$event) {
        $this->setupEnv($game,$event);
        $ch = new Championship;
        $au = new Range;

        $quals = [];
        for($i=1; $i<=5; $i++) {
            $rank = $ch->getRank($this->schema, $this->cpi->getId(), "3g$i%");
            $quals[] = $rank[0]['tea_id'];
            $quals[] = $rank[1]['tea_id'];
        }
        $quals = $au->intersect($this->cpi_data->teams, $quals);
        $pot1 = $au->subRange($quals,0,1);
        $pot2 = $au->subRange($quals,2,3);
        $pot3 = $au->subRange($quals,4,5);
        $pot4 = $au->subRange($quals,6,7);
        $pot5 = $au->subRange($quals,8,9);
        shuffle($pot1);
        shuffle($pot2);
        shuffle($pot3);
        shuffle($pot4);
        shuffle($pot5);
        $gr1 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4), array_pop($pot5) ];
        $gr2 = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4), array_pop($pot5) ];

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2012-03-01
        $precDate = '2012-03-01';
        $scheduleDate = ['2012-06-03', '2012-06-08', '2012-06-12', '2012-09-11', '2012-10-16', '2012-11-14', '2013-03-26', '2013-06-04', '2013-06-11', '2013-06-18'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }

        $cal = $ch->roundRobin($this->schema, $gr1, $this->cpi, $schedule, "4g1.", true);
        $cal = $ch->roundRobin($this->schema, $gr2, $this->cpi, $schedule, "4g2.", true);

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.playoff');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 5e tour preliminaire de la Coupe du Monde, zone Asie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function playoff($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;

        $rank1 = $ch->getRank($this->schema, $this->cpi->getId(), "4g1%");
        $rank2 = $ch->getRank($this->schema, $this->cpi->getId(), "4g2%");

        // two first of each group go to WC
        // 3rd go to playoff

        $d = new \DateTime($event->getDate()); // 2013-06-19
        $d->modify("+79 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+4 days");
        $date2 = $d->format('Y-m-d');
        $cup->setHomeAwayMatch($game,$this->cpi->getId(),'5a','5b',[$rank1[2]['tea_id']],[$rank2[2]['tea_id']],$date1,$date2);

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(13);
        $e->setFunction('Fifa.Afc.WorldCupQualification.barrage');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du barrage de la Coupe du Monde, zone Asie');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function barrage($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;

        $qualTeams = $cup->getQualifiedTeams($game, $this->cpi->getId(), '5b');

        // will go to barrage against conmebol
    }
}

$g = new Game;
$g->load('g_6');
$e = new Event('g_6');
$e->load(17);
$w = new WorldCupQualification;
$w->barrage($g,$e);


