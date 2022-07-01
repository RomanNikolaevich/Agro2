<?php

/**
 * @var $link
 */

if(isset($_SESSION['user']) && $_SESSION['user']['id'] == (int)$_GET['id']) {
    $id = (int)$_GET['id'];
    $users = q("
	SELECT *
	FROM `users`
	WHERE 	`id` = " . $id . "
	Limit 1
	");

    $row = mysqli_fetch_assoc($users);

//Меняем формат вывода даты регистрации:
    $qDateReg = q("
	SELECT *, DATE_FORMAT(date_reg, '%d.%m.%Y %T (%W)') AS 'date_reg'
	FROM `users`
	WHERE 	`id` = " . $id. "
	");
    $dateReg = mysqli_fetch_assoc($qDateReg);
} else {
    //echo 'это не ваш профиль';
    header('Location: /');
    exit();
}

//выводим сообщение и чистим сессии
if (isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
