<?php

//вывод пользователей из БД в main.tpl
$userDb = q("
    SELECT *
    FROM `users`
    ORDER BY `id` DESC
");

//Выставляем права пользователям:
//Заблокированный пользователь:
if(isset($_GET['action']) && $_GET['action']=='blocked'){
    q("
        UPDATE `users` SET
       `access` = 'Blocked'
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//Обычный пользователь:
if(isset($_GET['action']) && $_GET['action']=='regular'){
    q("
        UPDATE `users` SET
       `access` = 'Regular'
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//Админ пользователь:
if(isset($_GET['action']) && $_GET['action']=='admin'){
    q("
        UPDATE `users` SET
       `access` = 'Admin'
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//СуперАдмин пользователь:
if(isset($_GET['action']) && $_GET['action']=='superadmin'){
    q("
        UPDATE `users` SET
       `access` = 'SuperAdmin'
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/users");
    exit();
}

//Удаление пользователя
if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `users`
		WHERE `id` = ".(int)$_GET['id']."
	");
    $_SESSION['info'] = 'Пользователь id = '.$_GET['id'].' успешно удален';
    header("Location: /admin/users");
    exit();
}

//выводим сообщение и чистим сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
