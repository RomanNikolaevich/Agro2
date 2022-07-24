<?php

if(isset($_POST['add'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['description'])) {
    q("
		INSERT INTO `news` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`date`        = NOW()
	");
    $_SESSION['info'] = 'Запись была добавлена'; //уведомление пользователя, что его новость была добавлена
    header('Location: /admin/news'); //переадресацию на главную страничку на main
    exit();
}

//Выбор категории новостей в виде выпадающего списка
$newsCatShow = q("
    SELECT *
    FROM `news_cat`
    ORDER BY `id`
    ");
