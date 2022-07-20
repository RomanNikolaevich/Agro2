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
    if ($row['access'] == SUPER_ADMIN && $_SESSION['user']['access'] == SUPER_ADMIN) {
        //это страница Суперадмина и ее могут редактировать только Суперадмины
        //загрузка аватарки:
        if (isset($_POST['submit'])) {
            //$file = $_FILES['file'];
            $avatarUser = new Uploader;
            $avatarUser->uploadFile($_FILES['file'], IMG_MINI);
            $avatarUser->resize(100, 100, IMG_MINI);
            $info= $avatarUser->error;
            $name = $avatarUser->name;
            q("
                UPDATE `users` SET
                `img`       = '" . mres($name) . "'
                WHERE `id`    = " . $id . "
             ");
            header("Location: /admin/users/edit?id=$id");
        }

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

    } elseif ($row['access'] == SUPER_ADMIN && $_SESSION['user']['access'] != SUPER_ADMIN) {
        //это страница Суперадмина и Админы ее редактировать не могут
        header("Location: /admin/users/full?id=$id");
        echo "у вас нет прав для редактирования этой страницы";
        exit();
    } else {
        //Эту страницы можно редактировать любому админу;
        /* if(isset($_SESSION['user'])
            && $_SESSION['user']['access'] == ADMIN
            || $_SESSION['user']['access'] == SUPER_ADMIN) {
            header("Location: /admin/users/edit?id=$id");
        } else {
            header("Location: /users/edit?id=$id");
        }*/

        //загрузка аватарки:
        if (isset($_POST['submit'])) {

            $avatarUser = new Uploader;
            $avatarUser->uploadFile($_FILES['file'], IMG_MINI);
            $avatarUser->resize(100, 100, IMG_MINI);
            $info= $avatarUser->error;
            $name = $avatarUser->name;
            q("
                UPDATE `users` SET
                `img`       = '" . mres($name) . "'
                WHERE `id`    = " . $id . "
             ");
            header("Location: /admin/users/edit?id=$id");
        }

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

if (isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
