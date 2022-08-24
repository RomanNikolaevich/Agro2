<?php
error_reporting(-1);
ini_set('display_errors', 'on');
header('Content-Type: text/html; charset=utf-8');
session_start();

if (isset($_SERVER['REQUEST_URI'])) {
    $tmp = trim($_SERVER['REQUEST_URI'], '/');
    $tmp = explode('?', $tmp);
    if ($tmp[0] != 'index.php') {
        $_GET['route'] = $tmp[0];
    }
}

// Конфиг сайта
include_once __DIR__ . '/vendor/autoload.php';
include_once './config.php';
include_once './db_config.php';
include_once './libs/default.php';
include_once './variables.php';

// Роутер
ob_start();
include './'.Core::$CONT.'/allpages.php';
if(!file_exists('./'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php')
    || !file_exists('./skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl')){
    error404 ();
}
include './'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php';
include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
$content = ob_get_contents();
ob_end_clean();

if (isset($_POST['ajax'])) {
    echo $content;
    exit();
}

include './skins/'.Core::$SKIN.'/index.tpl';
