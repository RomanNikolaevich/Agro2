<?php
//Создание доступа к странице
/*if (!isset($_SESSION['user']) || $_SESSION['user']['access'] != 1) {
	exit();
}*/

if (!empty($_POST['login']) && !empty($_POST['password'])) {
	$login = $_POST['login'];
	$password = $_POST['password'];
	//Сверка даннх из формы авторизации с данными в БД:
	$res = q("
		SELECT *
		FROM `users`
		WHERE `login`      = '" . mres($login) . "'
			&& `password` = '" . myHash($password) . "'
			LIMIT 1
	");

	//Если запрос выполнен успешно
	if (mysqli_num_rows($res)) {
		//Проверка на активацию по почте:
		$access = mysqli_fetch_assoc($res);
		if ($access['active'] == 1) {
			$_SESSION['user'] = $access;
            $_SESSION['reg'] = 'Поздравляю, Вы авторизированы';

			//если галочку согласия с автоавторизацией пользователь отметил:
			if (!empty($_POST['autoauthconfirm'])) {
				$autoauthhash = myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email']);
				setcookie('autoauthid', $_COOKIE['PHPSESSID'], time() + 3600 * 30, '/');
				setcookie('autoauthhash', $autoauthhash, time() + 3600 * 30, '/');
				q("
			UPDATE `users` SET
				`hash` = '" . mres($autoauthhash) . "'
				WHERE `users`.`id` = " . (int)$_SESSION['user']['id'] . "
			");
			} else {
				$error = 'Вы не активировали свой аккаунт через почтовый ящик, завершите процесс активации';
			}
		}
	}
}
