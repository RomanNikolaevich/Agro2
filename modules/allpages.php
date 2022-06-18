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
    if($_SESSION['user']['active'] !=1) { //0 - не активирован, 1 - активирован, 2- забанен.
        header("Location: index.php?module=auth&page=logout");
        exit();
    }
}

///для неавторизированных, но которые согласились на авто-авторизацию:
if (isset($_COOKIE['autoauthhash'], $_COOKIE['autoauthid'])) {
	$res = q("
	SELECT * 
	FROM `users` 
	WHERE `hash` = '" . hsc($_COOKIE['autoauthhash']) . "'
");
	$_SESSION['user'] = mysqli_fetch_assoc($res);
}
