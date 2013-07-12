<?php
require_once __DIR__.'/../vendor/autoload.php';

use \Manafoot\ComponentBundle\Database;

$app = new Silex\Application();
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/views',
));

$db = new \Manafoot\ComponentBundle\Database;

$app->get('/association/list', function () use ($app,$db) {
    $association = $db->select('select * from ass_association left join cou_country on ass_cou_id=cou_id' );
    return $app['twig']->render('associationlist.tpl', array(
        'association' => $association,
    ));
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

