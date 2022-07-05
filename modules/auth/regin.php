<?php
/**
 * @var $link
 */
if(isset($_POST['login'], $_POST['email'], $_POST['password'])) {
	$errors = [];

    $login = mres($_POST['login']);
	$password = mres($_POST['password']);
	$email = mres($_POST['email']);
	$age = (int)$_POST['age'];

    //$query = "SELECT * FROM users WHERE login='$login'";
	//$user = mysqli_fetch_assoc(q($query));

/*    if(!empty($login)) {
        if (!preg_match('#^[-A-Za-zА-ЯЁа-яё\d]{3,18}$#u', $login)) {
            $errors['login'] = 'Для логина доступны только латинские и кирилические буквы (большие и маленькие),
         цифры, тире и подчеркивание, от 3-х до 18 символов';
        }
    }*/

	if(empty($login)) {
		$errors['login2'] = 'Вы не заполнили логин';
	} elseif (mb_strlen($login) < 2) {
		$errors['login2'] = 'Логин слишком короткий';
	} elseif (mb_strlen($login) > 18) {
		$errors['login2'] = 'Логин слишком длинный';
	}

	if(empty($password)) {
		$errors['password'] = 'Вы не заполнили пароль';
	} elseif (mb_strlen($password) < 5) {
		$errors['login'] = 'Пароль слишком короткий, не меньше 4 символов';
	}

	if(empty($email) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
		$errors['email'] = 'Вы не заполнили email';
	}

	if(empty($age)) {
		$errors['age'] = 'Вы не заполнили ваш возраст';
	} elseif ($age < 1 || $age > 150) {
		$errors['age'] = 'Введите правильный возраст';
	}
	//Делаем проверку логина и email на уникальность (на дубликаты):
	if (!count($errors)) {
		$res = q("
				SELECT `id`
				FROM `users`
				WHERE `login` = '".$login."'
				LIMIT 1
			");
		if(mysqli_num_rows($res)) {
			$errors['login'] = 'Такой логин уже занят';
		}
		$res = q("
				SELECT `id`
				FROM `users`
				WHERE `email` = '".$email."'
				LIMIT 1
			");
		if(mysqli_num_rows($res)) {
			$errors['email'] = 'Такой email уже занят';
		}
	}

	if(empty($user)) {
		if(!count($errors)) {
			q("
		INSERT INTO `users` SET
		`login`    = '".$login."',
		`password` = '".myHash($password)."',
		`email`    = '".$email."',
		`age`      = ".$age.",
		`ip`       = '" . ip2long($_SERVER['REMOTE_ADDR']) . "',
		`date_activ` = '" . time() . "',
		`hash`     = '".myHash($login.$age)."'
		");// or exit(mysqli_error($link)); //вывод ошибок БД нам не нужен - есть в функции
			$id = mysqli_insert_id($link);

			class_Mail::$to = $_POST['email'];
			class_Mail::$subject = 'Вы зарегистрировались на сайте';
			class_Mail::$text = '
			Добрый день. 
			Ваш почтовый ящик был указан во время регистрации на сайте roman.school-php.com
			Если вы не регистрировались, то не отвечайте на данное письмо. Если это все-таки
			вы регистрировались, то для активации вашего аккаунта пройдите по ссылке :
			'.Core::$DOMAIN.'index.php?module=auth&page=activate&id='.$id.'&hash='.myHash($_POST['login'].$_POST['age']).'
			';
			class_Mail::send();
			$_SESSION['regok'] = 'OK';
			header("Location: /auth/regin");
			exit();
		}
	}
}
