<?php
if(isset($_POST['ok'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['description'])) {
    q("
		UPDATE `users` SET
		`access` = '".mres(trimAll($_POST['***']))."',
		WHERE `news`.`id` = ".(int)$_GET['id']."
	");
    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /admin/users');
    exit();
}

//вывод товаров из БД в main.tpl
$userDb = q("
    SELECT *
    FROM `users`
    ORDER BY `id` DESC
");

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}




