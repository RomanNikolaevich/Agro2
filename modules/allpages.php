<?php

///для неавторизированных, но которые согласились на авто-авторизацию:
if (isset($_COOKIE['autoauthhash'], $_COOKIE['autoauthid'])) {
	$res = q("
	SELECT * 
	FROM `users` 
	WHERE `hash` = '" . hsc($_COOKIE['autoauthhash']) . "'
");
	$_SESSION['user'] = mysqli_fetch_assoc($res);
}

//Логаут пользователей, которые не прошли активацию по почте
/*if(isset($_SESSION['user'])) {
    $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = ".$_SESSION['user']['id']."
            LIMIT 1
        ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);
    if($_SESSION['user']['active'] !=1) { //0 - не активирован, 1 - активирован, 2- забанен.
        $_SESSION['reg'] = 'Пройдите активацию по почте';
        //header("Location: index.php?module=auth&page=logout");
        exit();
    }
}*/
