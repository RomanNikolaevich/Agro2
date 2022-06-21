<?php
//Проверка на активацию + сверка с БД доступа пользователя
if(isset($_SESSION['user'])) {
    $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = ".$_SESSION['user']['id']."
            LIMIT 1
        ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);

    //убиваем сессию  и удаляем hash в БД для неактивированных и забаненых
    if($_SESSION['user']['active'] !=1 || $_SESSION['user']['access'] ==5) {
        $hashzero = 0;
        q("
			UPDATE `users` SET
				`hash` = '" . mres($hashzero) . "'
				WHERE `users`.`id` = " . (int)$_SESSION['user']['id'] . "
			");
    logout();
    }
} else {//если ($_SESSION['user'] не существует
    //для неавторизированных, но которые согласились на авто-авторизацию:
    if (isset($_COOKIE['autoauthhash'], $_COOKIE['autoauthid'])) {
        $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = '" . hsc($_COOKIE['autoauthid']) . "'
            && `hash` = '" . hsc($_COOKIE['autoauthhash']) . "'
            && `ip` = '" . ip2long($_SERVER['REMOTE_ADDR']) . "'
        ");
        $_SESSION['user'] = mysqli_fetch_assoc($res);
        if($_COOKIE['autoauthhash'] != $_SESSION['user']['hash']) {
            header("Location: /auth/logout");
        }
    }
}
