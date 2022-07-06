<?php
/**
 * @var $link
 */

$id = $_GET['id'];
$size = 450;
$file_path = './uploaded/goods/';
$imageDB = 'goods';
uploadImage($size, $file_path, $imageDB);

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
