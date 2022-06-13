<?php

//вывод пользователей из БД в main.tpl
$userDb = q("
    SELECT *
    FROM `users`
    ORDER BY `id` DESC
");

//Выставляем права пользователям:
//Обычный пользователь:
if(isset($_GET['action']) && $_GET['action']=='regular'){
    q("
        UPDATE `users` SET
       `access` = 1
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//Админ пользователь:
if(isset($_GET['action']) && $_GET['action']=='admin'){
    q("
        UPDATE `users` SET
       `access` = 2
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//Заблокированный пользователь:
if(isset($_GET['action']) && $_GET['action']=='blocked'){
    q("
        UPDATE `users` SET
       `access` = 5
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//выводим сообщение и чистим сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
