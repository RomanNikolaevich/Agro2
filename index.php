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
include './modules/allpages.php';

// Роутер
include './modules/'.$_GET['module'].'/'.$_GET['page'].'.php';
include './skins/'.Core::$SKIN.'/index.tpl';
