<?php
/**
 * @var $link
 */

$users = q("
	SELECT *
	FROM `users`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	");

if(!mysqli_num_rows($users)) {
    $_SESSION['info'] = 'Данного пользователя не существует!';
    header("Location: /admin/users");
    exit();
}

$row = mysqli_fetch_assoc($users);
