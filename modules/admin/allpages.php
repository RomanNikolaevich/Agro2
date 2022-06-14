<?php
if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != 2) {
    if($_GET['module'] != 'static' || $_GET['page'] != 'main') {
        header("Location: /admin/static/main");
        exit();
    }
}

if(empty($_GET['module']) && $_GET['page']=='main') {
    header("Location: /admin/static/main");
    exit();
    }

unset($_SESSION['reg']);
