<?php
if(isset($_POST['add'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['description'])) {
    mysqli_query($link, "
		INSERT INTO `news` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`date`        = NOW()
	") or exit(mysqli_error());
    $_SESSION['info'] = 'Запись была добавлена'; //уведомление пользователя, что его новость была добавлена
    header('Location: /admin/news'); //переадресацию на главную страничку на main
    exit();
}
