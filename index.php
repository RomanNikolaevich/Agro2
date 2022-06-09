<?php
error_reporting(-1);
ini_set('display_errors', 'on');
header('Content-Type: text/html; charset=utf-8');
session_start();

// Конфиг сайта
include_once __DIR__ . '/vendor/autoload.php';
include_once './config.php';
include_once './db_config.php';
include_once './libs/default.php';
include_once './variables.php';

// Роутер
ob_start();
include './'.Core::$CONT.'/allpages.php';
include './'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php';
include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
$content = ob_get_contents();
ob_end_clean();

include './skins/'.Core::$SKIN.'/index.tpl';
