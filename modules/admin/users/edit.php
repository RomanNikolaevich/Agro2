<?php
/**
 * @var $row array
 */

include './modules/admin/users/full.php';
include './modules/admin/users/main.php';

$id = $_GET['id'];
//$row - это пользователь, которого хотим редактировать, ['access'] - его уровень доступа
//wtf($row);
if (isset($id)) {
    if ($row['access'] == 'SuperAdmin' && $_SESSION['user']['access'] == 'SuperAdmin') {
        //это страница Суперадмина и ее могут редактировать только Суперадмины
        //загрузка аватарки:
        uploadAvatarUser();
        //изменение пользовательских данных
        if (isset($_POST['ok'], $_POST['age'], $_POST['date'], $_POST['aboutme'], $_POST['password'])) {
            $login = $_POST['login'];
            $password = $_POST['password'];
            $age = $_POST['age'];
            $date = $_POST['date'];
            $aboutme = $_POST['aboutme'];
            editUserAdmin($login, $age, $date, $aboutme, $password);
            $_SESSION['info'] = 'Запись была изменена';
            header("Location: /admin/users/full?id=$id");
            exit();
        }

    } elseif ($row['access'] == 'SuperAdmin' && $_SESSION['user']['access'] != 'SuperAdmin'){
        //это страница Суперадмина и Админы ее редактировать не могут
        header("Location: /admin/users/full?id=$id");
        echo "у вас нет прав для редактирования этой страницы";
        exit();
    } else {
        //Эту страницы можно редактировать любому админу;
        //загрузка аватарки:
        uploadAvatarUser();
        //изменение пользовательских данных
        if (isset($_POST['ok'], $_POST['age'], $_POST['date'], $_POST['aboutme'], $_POST['password'])) {
            $login = $_POST['login'];
            $password = $_POST['password'];
            $age = $_POST['age'];
            $date = $_POST['date'];
            $aboutme = $_POST['aboutme'];
            editUserAdmin($login, $age, $date, $aboutme, $password);
            $_SESSION['info'] = 'Запись была изменена';
            header("Location: /admin/users/full?id=$id");
            exit();
        }
    }
}
