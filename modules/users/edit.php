<?php
/**
 * @var $row array
 */

include './modules/admin/users/full.php';
include './modules/admin/users/main.php';

$id = $_GET['id'];
//$row - это пользователь, которого хотим редактировать, ['access'] - его уровень доступа
//wtf($row);
if (isset($_SESSION['user']) && $_SESSION['user']['id'] == (int)$_GET['id']) {
    //загрузка аватарки:
    uploadAvatarUser();
    //изменение пользовательских данных
    if (isset($_POST['ok'], $_POST['age'], $_POST['aboutme'], $_POST['password'])) {
        $login = $_POST['login'];
        $password = $_POST['password'];
        $age = $_POST['age'];
        $date = $_POST['date'];
        $aboutme = $_POST['aboutme'];
        editUserCabinet($login, $age, $aboutme, $password);
        $_SESSION['info'] = 'Запись была изменена';
        header("Location: /users/main?id=$id");
        exit();
    }
} else {
    //echo 'это не ваш профиль';
    header('Location: /');
    exit();
}

