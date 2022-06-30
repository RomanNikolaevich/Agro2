<?php
//Доступ к странице только не авторизированным
/*if (isset($_SESSION['user'])) {
    header("Location: /");
	exit();
}*/

if (!empty($_POST['login']) && !empty($_POST['password'])) {
	$login = $_POST['login'];
	$password = $_POST['password'];
	//Сверка данных из формы авторизации с данными в БД:
	$res = q("
		SELECT *
		FROM `users`
		WHERE `login`      = '" . mres($login) . "'
			&& `password` = '" . myHash($password) . "'
			LIMIT 1
	");
//wtf($res, 1);
	//Если запрос выполнен успешно
	if (mysqli_num_rows($res)) {
        //wtf($res, 1);
		//Проверка на активацию по почте:
		$access = mysqli_fetch_assoc($res);
		if ($access['active'] == 1) {
			$_SESSION['user'] = $access;
            $_SESSION['reg'] = 'Поздравляю, Вы авторизированы';
//wtf($_SESSION['user'],1);
			//если галочку согласия с автоавторизацией пользователь отметил:
			if (!empty($_POST['autoauthconfirm'])) {
				$autoauthhash = myHash($_SESSION['user']['id'] . $_SESSION['user']['login'] . $_SESSION['user']['email']);
				setcookie('autoauthid', $_SESSION['user']['id'], time() + 3600 * 30, '/');
				setcookie('autoauthhash', $autoauthhash, time() + 3600 * 30, '/');
				q("
			UPDATE `users` SET
				`hash` = '" . mres($autoauthhash) . "',
				`ip` = '" . ip2long($_SERVER['REMOTE_ADDR']) . "'
				WHERE `users`.`id` = " . (int)$_SESSION['user']['id'] . "
			");
			}
		} else {
            $error = 'Вы не активировали свой аккаунт через почтовый ящик, завершите процесс активации';
        }
	}
}
