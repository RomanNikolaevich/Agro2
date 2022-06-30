<?php
/**
 * @var $row array
 */

include './modules/admin/users/full.php';
include './modules/admin/users/main.php';

$id = $_GET['id'];
//$row - это пользователь, которого хотим редактировать, ['access'] - его уровень доступа
if (isset($id)) {
    if ($row['access'] == 'SuperAdmin' && $_SESSION['user']['access'] == 'SuperAdmin') {
        //echo "SuperAdmin может заходить сюда, видеть эту строчку и что-то здесь делать даже с такими как он";
        editUser();
    } elseif ($row['access'] == 'SuperAdmin' && $_SESSION['user']['access'] != 'SuperAdmin'){

        header("Location: /admin/users/full?id=$id");
        echo "у вас нет прав для редактирования этой страницы";
        exit();
    } else {
        //echo 'Эту страницы можно  любому админу редактировать';
        editUser();
    }
}
