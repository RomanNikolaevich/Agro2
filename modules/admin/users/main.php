<?php
if(isset($_POST['1']) || isset($_POST['2']) || isset($_POST['5'])) {
    $access = $_POST['1'] ?? $_POST['2'] ?? $_POST['5'] ?? '';
    q("
		UPDATE `users` SET
		`access` = '".mres(intArray($access))."',
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




