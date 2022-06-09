Главная страница
<?php if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
include './skins/default/auth/login.tpl';
} ?>
