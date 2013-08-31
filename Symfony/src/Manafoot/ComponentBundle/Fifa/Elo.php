<?php

namespace Manafoot\ComponentBundle\Fifa;

use Symfony\Component\HttpFoundation\Session\Session;

use \Manafoot\ComponentBundle\Database;
use \Manafoot\ComponentBundle\Game;
use \Manafoot\ComponentBundle\Event;
use \Manafoot\ComponentBundle\Flash;

class Elo {

    // Publish new Elo ranking
    public function pub (Game $game, Event $event) {

        $db = new Database;

        $schema = $game->getName();

        $sql = "insert into $schema.elh_elo_history select elo_tea_id,elo_points,{$event->getId()}, '{$event->getDate()}' from $schema.elo_elo";
        $db->query($sql);

        $sql = "
            select tea_id,cou_name,elh_points 
            from $schema.elh_elo_history 
            inner join tea_team on elh_tea_id=tea_id 
            inner join ass_association on ass_id=tea_ass_id
            inner join lk_mbr_ass on mbr_ass_id__slave=ass_id
            inner join cou_country on cou_id=ass_cou_id 
            where mbr_ass_id__master=11
            and elh_evt_id = {$event->getId()}
            order by elh_points desc 
            limit 5;
        ";
        $db->query($sql);
        $rank = [];
        $i = 1;
        $flashtext = '<p>';
        while ($obj = $db->fetch()) {
            $rank[] = $obj;
            $flashtext .= "[$i] ({$obj->elh_points}) {$obj->cou_name}<br>";
            $i++;
        }
        $flashtext .= '</p>';
        $first = $rank[0];
        $name = $first->cou_name;

        
        // new Message
        $m = new Flash($schema);
        $m->setSubject($event->getDescr());
        $m->setBody("<p>$name est en tête du classement :</p>".$flashtext);
        $m->save();

        // next Elo publishing
        $d = new \DateTime($event->getDate());
        $d->modify('+1 month');
        $e = new Event($schema);
        $e->setDate($d->format('Y-m-d'));
        $e->setAssociation(1);
        $e->setFunction('Fifa.Elo.pub');
        $e->setVisibility('foreground');
        $e->setDescr('Classement mondial FIFA - '.$d->format('F Y'));
        $e->setStatus('todo');
        $e->save();
    }

    public function update($schema, $tea_id, $elo_points) {
        $db = new Database;
        $sql = "update $schema.elo_elo set elo_points={$elo_points} where elo_tea_id={$tea_id}";
        $db->query($sql);
    }

    public function getEstimatedResult($elo1,$elo2) {
        $dr1 = $elo1+130-$elo2;
        $We1 = 1/(1+pow(10,(0-$dr1)/400));
        //$dr2 = $elo2-100-$elo1;
        //$We2 = 1/(1+pow(10,(0-$dr2)/400));
        $c = 100*$We1;
        return $c;
    }

    public function computeNewElo($elo1,$elo2,$goal1,$goal2,$K) {
        $dr1 = $elo1+100-$elo2;
        $We1 = 1/(1+pow(10,(0-$dr1)/400));
        $dr2 = $elo2-100-$elo1;
        $We2 = 1/(1+pow(10,(0-$dr2)/400));

        $d = abs($goal1-$goal2);
        switch($d) {
            case 0:
            case 1:
                $G = 1;
            case 2:
                $G = 1.5;
            default:
                $G = (11+$d)/8;
        }
        if($goal1>$goal2) {
            $elo1 = $elo1 + $K*$G*(1 - $We1);
            $elo2 = $elo2 + $K*$G*(0 - $We2);
        }
        else if ($goal1==$goal2) {
            $elo1 = $elo1 + $K*$G*(0.5 - $We1);
            $elo2 = $elo2 + $K*$G*(0.5 - $We2);
        }
        else {
            $elo1 = $elo1 + $K*$G*(0 - $We1);
            $elo2 = $elo2 + $K*$G*(1 - $We2);
        }
        if ($elo1<0) {
            $elo1 = 0;
        }
        if ($elo2<0) {
            $elo2 = 0;
        }
        $elo1 = round($elo1);
        $elo2 = round($elo2);
        return [$elo1,$elo2];
    }

    public function sortTeam($schema, $teams) {
        $db = new Database;
        $ret = [];
        $sTeams = implode(',',$teams);
        $sql = "select * from $schema.elo_elo where elo_tea_id in ($sTeams) order by elo_points desc";
        $db->query($sql);
        while ($row = $db->fetch()) {
            $ret[] = $row->elo_tea_id;
        }
        return $ret;
    }
}


