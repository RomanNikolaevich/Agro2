<?php
/**
 * @var $link
 */

/*$id = $_GET['id'];
$size = 450;
$file_path = './uploaded/goods/';
$imageDB = 'goods';
uploadImage($size, $file_path, $imageDB, $id);*/
class_Uploader::$id = $_GET['id'];
class_Uploader::$size = 450;
class_Uploader::$file_path = './uploaded/goods/';
class_Uploader::$imageDB = 'goods';


$goods = q("
	SELECT *
	FROM `goods`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	");

if(!mysqli_num_rows($goods)) {
    $_SESSION['info'] = 'Данного товара не существует!';
    header("Location: /admin/goods");
    exit();
}

$row = mysqli_fetch_assoc($goods);

if(isset($_POST['title'])) {
    $row['title'] = $_POST['title'];
}

if(isset($_POST['cat'])) {
    $row['cat'] = $_POST['cat'];
}

if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
