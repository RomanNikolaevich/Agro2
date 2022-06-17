<?php

include_once './'.Core::$CONT.'/allpages.php';

unset($_SESSION['reg']);

if(isset($_SESSION['user'])) {
    $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = ".$_SESSION['user']['id']."
            LIMIT 1
        ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);
    if($_SESSION['user']['access'] !=2) {
        header("Location: /");
        exit();
    }
} else {
    if($_GET['module'] != 'static' || $_GET['page'] != 'main') {
        header("Location: /admin/static/main");
        exit();
}
}
//редирект, если пользователь вводит вручную адресс /admin
if(empty($_GET['module']) && $_GET['page']=='main') {
    header("Location: /admin/static/main");
    exit();
    }
