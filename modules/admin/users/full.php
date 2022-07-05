<?php
/**
 * @var $link
 */

$users = q("
	SELECT *
	FROM `users`
	WHERE 	`id` = " . (int)$_GET['id'] . "
	Limit 1
	");

if (!mysqli_num_rows($users)) {
    $_SESSION['info'] = 'Данного пользователя не существует!';
    header("Location: /admin/users");
    exit();
}

$row = mysqli_fetch_assoc($users);
//wtf($row);
//Меняем формат вывода даты регистрации:
$qDateReg = q("
	SELECT *, DATE_FORMAT(date_reg, '%d.%m.%Y %T (%W)') AS 'date_reg'
	FROM `users`
	WHERE 	`id` = " . (int)$_GET['id'] . "
	");
$dateReg = mysqli_fetch_assoc($qDateReg);


//Проверка длинны текста сделать (в БД ограничение в 1000 символов)
