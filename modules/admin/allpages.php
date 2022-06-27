<?php

include_once './' . Core::$CONT . '/allpages.php';

//проверка доступа в адинку
if (isset($_SESSION['user'])) {
    $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = " . $_SESSION['user']['id'] . "
            LIMIT 1
        ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);
    if(isset($_SESSION['user'])
        && ($_SESSION['user']['access'] === ADMIN
        || $_SESSION['user']['access'] === SUPER_ADMIN)) {
      $_SESSION['info'] = '';
    } else {
        header("Location: /");
        exit();
    }
} else {
    if ($_GET['module'] != 'static' || $_GET['page'] != 'main') {
        header("Location: /admin/static/main"); //переадресация на авторизацию
        exit();
    }
}
//редирект, если пользователь вводит вручную адресс /admin
if (empty($_GET['module']) && $_GET['page'] == 'main') {
    header("Location: /admin/static/main");
    exit();
}

unset($_SESSION['reg']);
