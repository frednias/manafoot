<?php

namespace Manafoot\ComponentBundle;

//require('../../../../tests/autoload.php');
use \Manafoot\ComponentBundle\Entity;
use \Manafoot\ComponentBundle\Database;

class Match extends Entity {

    protected static $table;
    protected static $prefix;
    protected static $sequence;

    private $schems;

    public function __construct($schema) {
        self::$table = $schema.'.mat_match';
        self::$prefix = 'mat_';
        self::$sequence = $schema.'.mat_match_mat_id_seq';
        $this->params = array(
        );
        parent::__construct();
        $this->schema = $schema;
    }

    public function getId() {
        return $this->id;
    }

    public function setCompetitionInstance($cpi_id) {
        $this->params['mat_cpi_id'] = $cpi_id;
    }

    public function setRound($round) {
        $this->params['mat_round'] = $round;
    }

    public function setTeam1($tea_id) {
        $this->params['mat_tea_id__1'] = $tea_id;
    }
    public function setTeam2($tea_id) {
        $this->params['mat_tea_id__2'] = $tea_id;
    }

    public function setDate($date) {
        $this->params['mat_date'] = $date;
    }

    public function setType($type) {
        $this->params['mat_mtt_id'] = $type;
    }

    public function setScore2($score) {
        $this->params['mat_score__2'] = $score;
    }
    public function setScore1($score) {
        $this->params['mat_score__1'] = $score;
    }

    public function setTab1($tab1) {
        $this->params['mat_tab__1'] = $tab1;
    }
    public function setTab2($tab2) {
        $this->params['mat_tab__2'] = $tab2;
    }

    public function load($id) {
        $this->get($id);
    }

    public function setMatchReferer($mat_id) {
        $this->params['mat_id'] = 7;
        $db = new Database;
        $db->query("insert into ".$this->schema.".mar_match_referer (mar_mat_id,mar_mat_id__referer) values (".$this->getId().",$mat_id)");
    }

    public function computeAll($date) {
        $schema = $this->schema;
        $elo = new Fifa\Elo;

        $sql = "
            select m1.mat_id, t1.tea_name as e1, e1.elo_points as elo1, t2.tea_name as e2, e2.elo_points as elo2, cpt_elo_level, m1.mat_mtt_id, mr.mat_score__1, mr.mat_score__2, mar_mat_id, mar_mat_id__referer, m1.mat_tea_id__1, m1.mat_tea_id__2
            from $schema.mat_match  m1
            inner join tea_team t1 on m1.mat_tea_id__1=t1.tea_id 
            inner join tea_team t2 on m1.mat_tea_id__2=t2.tea_id 
            inner join $schema.elo_elo e1 on e1.elo_tea_id=m1.mat_tea_id__1 
            inner join $schema.elo_elo e2 on e2.elo_tea_id=m1.mat_tea_id__2 
            inner join $schema.cpi_competition_instance on m1.mat_cpi_id=cpi_id
            inner join cpt_competition on cpi_cpt_id=cpt_id
            left join $schema.mar_match_referer on mar_mat_id=m1.mat_id
            left join $schema.mat_match mr on mr.mat_id=mar_mat_id__referer
            where m1.mat_date='$date';
        ";
        $objectList = parent::select($sql);

        foreach ($objectList as $match) {
            $mat = new Match($this->schema);
            $mat->load($match->mat_id);
            $K = $match->cpt_elo_level;
            $elo1 = $match->elo1;
            $elo2 = $match->elo2;
            $est = $elo->getEstimatedResult($elo1,$elo2);

            $goal1 = $goal2 = 0;
            list($goal1,$goal2) = $this->play($goal1,$goal2,90,$est);

            if ($goal1==$goal2 && $match->mat_mtt_id==3) { // prolongation
                $prolongation = true;
                list($goal1,$goal2) = $this->play($goal1,$goal2,30,$est);
                if ($goal1==$goal2) {
                    list($tab1,$tab2) = $this->tab($est);
                    $mat->setTab1($tab1);
                    $mat->setTab2($tab2);
                }
            }

            if(!empty($match->mar_mat_id__referer) && $match->mat_mtt_id==5) {
                $ref1 = $match->mat_score__1;
                $ref2 = $match->mat_score__2;

                $tot1 = $goal1 + $match->mat_score__2;
                $tot2 = $goal2 + $match->mat_score__1;
                if ($tot1==$tot2 && $goal2==$match->mat_score__2) {
                    $prolongation = true;
                    list($goal1,$goal2) = $this->play($goal1,$goal2,30,$est);
                    $tot1 = $goal1 + $match->mat_score__2;
                    $tot2 = $goal2 + $match->mat_score__1;
                    if ($tot1==$tot2 && $goal2==$match->mat_score__2) {
                        list($tab1,$tab2) = $this->tab($est);
                        $mat->setTab1($tab1);
                        $mat->setTab2($tab2);
                    }
                }
            }

            $mat->setScore1($goal1);
            $mat->setScore2($goal2);
            $mat->save();

            list($newelo1,$newelo2) = $elo->computeNewElo($elo1,$elo2,$goal1,$goal2,$K);
            $elo->update($schema, $match->mat_tea_id__1, $newelo1);
            $elo->update($schema, $match->mat_tea_id__2, $newelo2);
        }
    }

    public function tab($est) {
        return [rand(0,3),rand(4,7)];
    }

    public function play($goal1,$goal2,$minute, $estimation) {
        $max = 45;
        for($i=1;$i<=$minute;$i++) {
            $t = rand(0,100);
            if ($t>$estimation) {
                //e2
                if (rand(0,$max)==0) {
                    $goal2++;
                }
            }
            else {
                //e1
                if (rand(0,$max)==0) {
                    $goal1++;
                }
            }
        }
        return [$goal1,$goal2];
    }
}

/*
$g = new Game;
$g->load('g_4');
$w = new Match('g_4');
$w->computeAll($g->getResumeDate());
*/

