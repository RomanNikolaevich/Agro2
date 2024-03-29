<?php

if (!empty($_POST['login_auth']) && !empty($_POST['password_auth'])) {
	$loginAuth = mres($_POST['login_auth']);
	$passwordAuth = mres($_POST['password_auth']);
	//Сверка данных из формы авторизации с данными в БД:
	$res = q("
		SELECT *
		FROM `users`
		WHERE `login`      = '" . $loginAuth . "'
			&& `password` = '" . myHash($passwordAuth) . "'
			LIMIT 1
	");

    //Если запрос выполнен успешно
	if (mysqli_num_rows($res)) {
		//Проверка на активацию по почте:
		$access = mysqli_fetch_assoc($res);
		if ($access['active'] == 1) {
			$_SESSION['user'] = $access;
            $notice = 'Поздравляю, Вы авторизированы';

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
	} else {
        $error = 'Вы ввели не верные данные при авторизации';
        //exit();
    }
}
