<?php
require_once __DIR__.'/../vendor/autoload.php';

use \Manafoot\ComponentBundle\Database;

$db = new \Manafoot\ComponentBundle\Database;

$app = new Silex\Application();
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/views',
));

/* TODO
*/

$app->post('/competition/member/add/{id}', function ($id) use ($app,$db) {
    $tea_id = $_POST['team'];
    $sql = "insert into init.lk_chp_cpt_tea (chp_cpt_id, chp_tea_id) values ($id,$tea_id)";
    $db->query($sql);
    return $app->redirect('/competition/view/'.$id);
});

$app->post('/championship/create/{id}', function($id) use ($app,$db) {
    $chi_level = $_POST['chi_level'];
    $chi_nb_team = $_POST['chi_nb_team'];
    $chi_nb_group = $_POST['chi_nb_group'];
    $chi_nb_promote = $_POST['chi_nb_promote'];
    $chi_nb_relegate = $_POST['chi_nb_relegate'];
    $sql = "insert into chi_championship_info (chi_cpt_id,chi_level,chi_nb_team,chi_nb_group,chi_nb_promote,chi_nb_relegate) values ($id, $chi_level, $chi_nb_team, $chi_nb_group, $chi_nb_promote, $chi_nb_relegate)";
    $db->query($sql);
    return $app->redirect('/competition/view/'.$id);
});

$app->post('/team/create/{ass_id}', function($ass_id) use ($app,$db) {
    $name = pg_escape_literal($_POST['tea_name']);
    $gender = $_POST['tea_gender'];
    $sql = "insert into tea_team (tea_name,tea_ass_id,tea_gender) values ($name, $ass_id, '$gender')  returning currval('global_seq')";
    $ress = $db->query($sql);
    $fch = pg_fetch_row($ress);
    $tea_id = $fch[0];
    $elo_points = $_POST['elo_points'];
    $sql = "insert into init.elo_elo (elo_tea_id,elo_points) values ($tea_id, $elo_points)";
    $db->query($sql);
    return $app->redirect('/association/view/'.$ass_id);
});
$app->post('/competition/create', function () use ($app,$db) {
    $matchs = [];
    preg_match('/\[(\d+)\]\s.*/', $_POST['ass_name'], $matchs);
    $db->query("insert into cpt_competition (cpt_name,cpt_ass_id,cpt_elo_level) values ('{$_POST['cpt_name']}',{$matchs[1]},{$_POST['cpt_elo_level']})");
    return $app->redirect('/competition/list');
});

$app->get('/country/lookup/{query}', function ($query) use ($app,$db) {
    $res = $db->select("select * from cou_country where cou_name ilike '%{$query}%' limit 5");
    return json_encode($res);
});

$app->get('/association/lookup/{query}', function ($query) use ($app,$db) {
    $res = $db->select("select * from ass_association where ass_name ilike '%{$query}%' limit 5");
    return json_encode($res);
});

$app->get('/elo', function () use ($app,$db) {
    $elo = $db->select("select * from init.elo_elo inner join tea_team on tea_id=elo_tea_id");

    return $app['twig']->render('elo.tpl', array(
        'elo' => $elo,
    ));
});

$app->post('/elo/edit/{id}', function($id) use ($app,$db) {

    $pts = $_POST['elo_points'];
    $sql = "update init.elo_elo set elo_points=$pts where elo_tea_id=$id";
    $db->query($sql);

    return $app->redirect('/elo');
});

$app->get('/elo/edit/{id}', function($id) use ($app,$db) {

    $elo = $db->select("select * from init.elo_elo inner join tea_team on tea_id=elo_tea_id where tea_id=$id");

    return $app['twig']->render('eloedit.tpl', array(
        'elo' => $elo,
        'id' => $id,
    ));
});

$app->get('/competition/view/{id}', function ($id) use ($app,$db) {
    $sql = "select * from chi_championship_info where chi_cpt_id=$id";
    $chi = $db->select($sql);
    $competition = $db->select("select * from cpt_competition inner join ass_association on ass_id=cpt_ass_id where cpt_id=$id");
    $teams = $db->select("select * from tea_team inner join ass_association on ass_id=tea_ass_id inner join lk_mbr_ass on mbr_ass_id__slave=ass_id where mbr_ass_id__master=1071;");
    $chp = $db->select("select * from init.lk_chp_cpt_tea inner join tea_team on tea_id=chp_tea_id where chp_cpt_id=$id");

    return $app['twig']->render('competitionview.tpl', array(
        'competition' => $competition,
        'cpt_id' => $id,
        'nb_chi' => count($chi),
        'chi' => $chi[0],
        'teams' => $teams,
        'chp' => $chp,
    ));
});

$app->get('/competition/list', function () use ($app,$db) {
    $competition = $db->select("select * from cpt_competition inner join ass_association on ass_id=cpt_ass_id");
    return $app['twig']->render('competitionlist.tpl', array(
        'competition' => $competition,
    ));
});

$app->get('/team/list', function () use ($app,$db) {
    $team = $db->select("select * from tea_team inner join ass_association on ass_id=tea_ass_id left join init.elo_elo on elo_tea_id=tea_id");

    return $app['twig']->render('teamview.tpl', array(
        'team' => $team,
    ));
});

$app->get('/team/view/{id}', function ($id) use ($app,$db) {
    $team = $db->select("select * from tea_team inner join ass_association on ass_id=tea_ass_id left join init.elo_elo on elo_tea_id=tea_id where tea_id=$id");

    return $app['twig']->render('teamview.tpl', array(
        'team' => $team,
    ));
});

function associationListPagination($page) {
    global $app,$db;
    $count = $db->select('select count(*) as nb from ass_association left join cou_country on ass_cou_id=cou_id' );
    $n = $count[0]->nb;
    $offset = 20*$page-20;
    $association = $db->select("select * from ass_association left join cou_country on ass_cou_id=cou_id order by ass_id asc limit 20 offset $offset" );
    return $app['twig']->render('associationlist.tpl', array(
        'association' => $association,
        'page' => $page,
        'count' => $n,
    ));
}
$app->get('/association/list/{page}', function ($page) use ($app,$db) {
    return associationListPagination($page);
});
$app->get('/association/list', function () use ($app,$db) {
    return associationListPagination(1);
});

$app->post('/association/create/slave/{id}', function ($id) use ($app,$db) {
    $association = $db->select('select * from ass_association left join cou_country on ass_cou_id=cou_id where ass_id='.$id)[0];
    $ass_cou_id = $association->ass_cou_id;
    $ass_name = pg_escape_literal($_POST['ass_name']);
    $sql = "insert into ass_association (ass_name,ass_cou_id) values ($ass_name, '$ass_cou_id') returning currval('global_seq')";
    $ress = $db->query($sql);
    $fch = pg_fetch_row($ress);
    $last_id = $fch[0];
    $sql = "insert into lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values ($id,$last_id)";
    $db->query($sql);
    return $app->redirect('/association/view/'.$id);
});

$app->get('/association/view/{id}', function ($id) use ($app,$db) {
    $association = $db->select('select * from ass_association left join cou_country on ass_cou_id=cou_id where ass_id='.$id);
    $master = $db->select("select * from lk_mbr_ass inner join ass_association on ass_id=mbr_ass_id__master where mbr_ass_id__slave=$id");
    $slave = $db->select("select * from lk_mbr_ass inner join ass_association on ass_id=mbr_ass_id__slave where mbr_ass_id__master=$id");
    $competition = $db->select("select * from cpt_competition where cpt_ass_id=$id");
    $team = $db->select("select * from tea_team where tea_ass_id=$id");
    return $app['twig']->render('associationview.tpl', array(
        'association' => $association,
        'master' => $master,
        'slave' => $slave,
        'competition' => $competition,
        'team' => $team,
        'ass_id' => $id,
    ));
});

$app->get('/country/view/{id}', function ($id) use ($app,$db) {
    $country = $db->select('select * from cou_country where cou_id='.$id);
    $association = $db->select('select * from ass_association where ass_cou_id='.$id);
    return $app['twig']->render('countryview.tpl', [ 
        'country' => $country,
        'association' => $association,
    ]);
});

$app->get('/country/list', function () use ($app, $db) {
    $country = $db->select("select * from public.cou_country");
    return $app['twig']->render('countrylist.tpl', array(
        'country' => $country,
    ));
});

$app->get('/', function() use ($app) {
    return $app['twig']->render('index.tpl', array(
    ));
});

$app->run();

