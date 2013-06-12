<?php

namespace Manafoot\ComponentBundle\Fifa\Caf;

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
use \Manafoot\ComponentBundle\Fifa;
use \Manafoot\ComponentBundle\Utils\Range;

/*
TODO :
    do not include soudan du sud yet
    exclude 3 teams not participating in 1rd round
    verify date 3rd round
*/

class WorldCupQualification {

    const CPT_ID = 6;

    // Starting World Cup Qualifications
    // Enters all Afc national team = X {52)
    // exclude world wup host team

    public function start (Game $game, Event $event) {
        $this->setupEnv($game,$event);
        $hostTeamId = $this->evt_params->host_tea_id;
        $schema = $this->schema;
        $cup = new Cup;


        // find and sort available team by elo points
        $sql = "
            SELECT elh_tea_id,cou_name,elh_points 
            FROM ass_association 
            INNER JOIN lk_mbr_ass a1       ON (a1.mbr_ass_id__slave=ass_id and a1.mbr_ass_id__master=12) 
            INNER JOIN cou_country         ON cou_id=ass_cou_id 
            INNER JOIN lk_mbr_ass a2       ON (a2.mbr_ass_id__slave=ass_id and a2.mbr_ass_id__master=1) 
            INNER JOIN $schema.elh_elo_history ON (elh_tea_id=cou_id)
            WHERE elh_date = (select max(elh_date) from $schema.elh_elo_history)
            AND elh_tea_id<>$hostTeamId
            order by elh_points desc
        ";
        $this->db->query($sql);
        while ($obj = $this->db->fetch()) {
            $teams[] = $obj->elh_tea_id; 
        }

        // insert new cpi
        $comp = new Competition($schema);
        $comp->get(WorldCupQualification::CPT_ID);
        $data = json_encode(array(
            'teams' => $teams,
            'master_cpi_id' => $this->evt_params->master_ci_id,
        ));
        $cpi = $comp->makeInstance($this->evt_params->year,$data);

        $n = count($teams); // 52 or 53, TODO : exclude mauritanie
        // want to save 40 teams
        $pot1 = [];
        $pot2 = [];
        for($i=$n-($n-40)*2; $i<40; $i++) {
            $pot1[] = $teams[$i];
            $pot2[] = $teams[$i+$n-40];
        }

        shuffle($pot1);
        shuffle($pot2);

        $d = new \DateTime($event->getDate()); // 2011-07-30
        $d->modify("+104 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+4 days");
        $date2 = $d->format('Y-m-d');
        $cup->setHomeAwayMatch($game,$cpi->getId(),'1a','1b',$pot1,$pot2,$date1,$date2);

        $d->modify("+1 days");
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(12);
        $e->setFunction('Fifa.Caf.WorldCupQualification.round2');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 2e tour preliminaire de la Coupe du Monde, zone Afrique');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$cpi->getId().'}');
        $e->save();
    }

    public function round2($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;
        $r = new Range;

        $qualTeams = $cup->getQualifiedTeams($game, $this->cpi->getId(), '1b');
        $exempts = $r->subRange($this->cpi_data->teams, 0, 40-count($qualTeams)-1);

        $round2Teams = array_merge($exempts,$qualTeams);
        $round2Teams = $r->intersect($this->cpi_data->teams, $round2Teams);

        $pot1 = $r->subRange($round2Teams,0,9);
        $pot2 = $r->subRange($round2Teams,10,19);
        $pot3 = $r->subRange($round2Teams,20,29);
        $pot4 = $r->subRange($round2Teams,30,39);
        shuffle($pot1);
        shuffle($pot2);
        shuffle($pot3);
        shuffle($pot4);

        $schedule = [0];
        $d = new \DateTime($event->getDate()); // 2011-11-16
        $precDate = '2011-11-16';
        $scheduleDate = ['2012-06-02', '2012-06-09', '2013-03-23', '2013-06-07', '2013-06-14', '2013-09-06'];
        foreach($scheduleDate as $date) {
            $diff = date_diff(new \DateTime($precDate), new \DateTime($date));
            $d->modify("+".$diff->days." days");
            $schedule[] = $d->format('Y-m-d');
            $precDate = $date;
        }

        for ($i=1; $i<=10; $i++) {
            $gr = [ array_pop($pot1), array_pop($pot2), array_pop($pot3), array_pop($pot4) ];
            $cal = $ch->roundRobin($this->schema, $gr, $this->cpi, $schedule, "2g$i.", true);
        }

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(12);
        $e->setFunction('Fifa.Caf.WorldCupQualification.round3');
        $e->setVisibility('foreground');
        $e->setDescr('Tirage au sort du 3e tour preliminaire de la Coupe du Monde, zone Afrique');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
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
        if (isset($this->evt_params->cpi_id)) {
            $this->cpi->get($this->evt_params->cpi_id);
            $this->cpi_data = json_decode($this->cpi->getData());
        }
    }

    public function round3($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;
        $au = new Range;
        
        $quals = [];
        for ($i=1; $i<=10; $i++) {
            $rank = $ch->getRank($this->schema, $this->cpi->getId(), "2g$i%");
            $quals[] = $rank[0]['tea_id'];
        }

        $pot1 = $au->subRange($quals,0,4);
        $pot2 = $au->subRange($quals,5,9);

        $d = new \DateTime($event->getDate()); // 2013-09-07
        $d->modify("+34 days");
        $date1 = $d->format('Y-m-d');
        $d->modify("+35 days");
        $date2 = $d->format('Y-m-d');

        $cup->setHomeAwayMatch($game,$this->cpi->getId(),'3a','3b',$pot1,$pot2,$date1,$date2);

        $d->modify("+1 days");
        $e = new Event($this->schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(12);
        $e->setFunction('Fifa.Caf.WorldCupQualification.end');
        $e->setVisibility('foreground');
        $e->setDescr('Fin des qualifications pour la Coupe du Monde, zone Afrique');
        $e->setStatus('todo');
        $e->setParams('{"cpi_id":'.$this->cpi->getId().'}');
        $e->save();
    }

    public function end($game,$event) {
        $this->setupEnv($game,$event);
        $cup = new Cup;
        $ch = new Championship;

        $qualTeams = $cup->getQualifiedTeams($game, $this->cpi->getId(), '3b');

        $li = '';
        foreach($qualTeams as $tea_id) {
            $team = new Team($this->schema);
            $team->get($tea_id);
            $li .= "<li>".$team->getName()."</li>";
        }
        $fla = new Flash($this->schema);
        $fla->setSubject('Qualifications des équipes africaines pour la Coupe du Monde');
        $fla->setBody("<p>Les équipes suivantes se sont qualifiés pour la Coupe du Monde, à l'issue du dernier tour :
                        <ul>
                            $li
                        </ul>");
        $fla->save();

        $wc = new Fifa\WorldCup;
        $wc->addQualifiedTeams($this->schema, $this->cpi_data->master_cpi_id,12,$qualTeams);
    }

}

/*
$g = new Game;
$g->load('g_16');
$e = new Event('g_16');
$e->load(55);
$w = new WorldCupQualification;
$w->end($g,$e);
*/


