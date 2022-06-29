<?php
//проверка на существование товара, избегание дублей (в БД тоже добавлена защита в виде
//индекса "ixTitle" тип "UNIQUE"
if(isset($_POST['add'], $_POST['title'], $_POST['text'], $_POST['cat'],
    $_POST['description'], $_POST['price'])) {
    $res = q("
				SELECT `id`
				FROM `goods`
				WHERE `title` = '".mres($_POST['title'])."'
				LIMIT 1
			");
    if(mysqli_num_rows($res)) {
        $errors['title'] = 'Такое название уже есть в БД';
    } else{
        q("
		INSERT INTO `goods` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`price`       = '".mysqli_real_escape_string($link, trim($_POST['price']))."'
	");
        $_SESSION['info'] = 'Товар был добавлен';
        header('Location: /admin/goods');
        exit();
    }
  }

//Делаем проверку логина и email на уникальность (на дубликаты):
if (!count($errors)) {
    $res = q("
				SELECT `id`
				FROM `goods`
				WHERE `login` = '".mres($_POST['login'])."'
				LIMIT 1
			");
    if(mysqli_num_rows($res)) {
        $errors['login'] = 'Такой логин уже занят';
    }
    $res = q("
				SELECT `id`
				FROM `users`
				WHERE `email` = '".mres($_POST['email'])."'
				LIMIT 1
			");
    if(mysqli_num_rows($res)) {
        $errors['email'] = 'Такой email уже занят';
    }
}
