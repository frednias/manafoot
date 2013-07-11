<?php
require_once __DIR__.'/../vendor/autoload.php';

use \Manafoot\ComponentBundle\Database;

$app = new Silex\Application();
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/views',
));

$db = new \Manafoot\ComponentBundle\Database;

$app->get('/country/list', function () use ($app, $db) {
    $country = getCountry($db);
    return $app['twig']->render('country.tpl', array(
        'country' => $country,
    ));
});

$app->get('/', function() use ($app) {
    return $app['twig']->render('index.tpl', array(
    ));
});

$app->run();

function getCountry($db)
{
    return $db->select("select * from public.cou_country");
}


