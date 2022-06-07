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
