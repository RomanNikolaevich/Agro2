<?php

//вывод пользователей из БД в main.tpl
if (isset($_POST['submit'], $_POST['search']) && !empty($_POST['search'])) {
    if(preg_match('#^[-A-Za-zА-ЯЁа-яё\d]+$#u', $_POST['search'])){
        $login = $_POST['search'];
        $userDb = q("
        SELECT *
        FROM `users`
        WHERE LOWER(`login`) LIKE LOWER('%".mres($login)."%')
");
    } else {
        $errors = 'Вы используете недопустимые символы!';
        $userDb = q("
        SELECT *
        FROM `users`
        ORDER BY `id` DESC
    ");
    }
} elseif (isset($_POST['reset'])) {
    $userDb = q("
    SELECT *
    FROM `users`
    ORDER BY `id` DESC
");
} else {
    $userDb = q("
    SELECT *
    FROM `users`
    ORDER BY `id` DESC
");
}

//Меняем права пользователям:
//Заблокированный пользователь:
if (isset($_GET['action']) && $_GET['action'] == 'blocked') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `access` = 'Blocked'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//Обычный пользователь:
if (isset($_GET['action']) && $_GET['action'] == 'regular') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `access` = 'Regular'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//Админ пользователь:
if (isset($_GET['action']) && $_GET['action'] == 'admin') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `access` = 'Admin'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//СуперАдмин пользователь:
if (isset($_GET['action']) && $_GET['action'] == 'superadmin') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `access` = 'SuperAdmin'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//Активация пользователя:
if (isset($_GET['action']) && $_GET['action'] == 'activeon') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `active` = '1'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//Отмена активации пользователя:
if (isset($_GET['action']) && $_GET['action'] == 'activeoff') {
    $id = (int)$_GET['id'];
    q("
        UPDATE `users` SET
       `active` = '2'
		WHERE `id` = " . $id . "
	");
    header("Location: /admin/users/edit?id=$id");
    exit();
}

//Удаление пользователя
if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    q("
		DELETE FROM `users`
		WHERE `id` = " . (int)$_GET['id'] . "
	");
    $_SESSION['info'] = 'Пользователь id = ' . $_GET['id'] . ' успешно удален';
    header("Location: /admin/users");
    exit();
}

//выводим сообщение и чистим сессии
if (isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
