<?php
/*if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
    if($_GET['module'] != 'static' || $_GET['page'] != 'main') {
        //wtf($_GET);
        //exit();
        header("Location: /admin/static/main");
        exit();
    }
}*/
if($_GET['module'] == 'admin' && empty($_GET['page'])) {
    //wtf($_GET);
    //exit();
    header("Location: /admin/static/main");
    exit();
    }

unset($_SESSION['reg']);
