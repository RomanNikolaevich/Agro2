<?php

include './modules/admin/users/full.php';
include './modules/admin/users/main.php';

if(isset($_POST['ok'], $_POST['age'], $_POST['date'], $_POST['aboutme'], $_POST['password'])) {
    q("
		UPDATE `users` SET
		`age`         = '" . mres(trim($_POST['age'])) . "',
		`password`    = '" . mres(myHash($_POST['password'])) . "',
		`date_reg`    = '" . mres(trim($_POST['date'])) . "',
		`about`       = '" . mres(trim($_POST['aboutme'])) . "'
		WHERE `id`    = " . (int)$_GET['id'] . "
	");

    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /admin/users');
    exit();
}
