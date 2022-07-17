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
/*    $size = 100;
    $file_path = './uploaded/mini/';
    $imageDB = 'users';
    uploadImage($size, $file_path, $imageDB, $id);*/
    //class_Uploader::$id = $_GET['id'];
    class_Uploader::$size = 100;
    class_Uploader::$file_path = './uploaded/mini/';
    class_Uploader::$imageDB = 'users';
    class_Uploader::uploadFile($_FILES['file']);
    class_Uploader::resize(class_Uploader::$file_path, class_Uploader::$name, class_Uploader::$size, class_Uploader::$type);
    class_Uploader::uploadToDB(class_Uploader::$name, class_Uploader::$imageDB, class_Uploader::$id);


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

if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
