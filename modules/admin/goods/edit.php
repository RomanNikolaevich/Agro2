<?php
/**
 * @var $link
 */
if(isset($_POST['ok'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['price'], $_POST['description'])) {
    q("
		UPDATE `goods` SET
		`cat`         = '" . mysqli_real_escape_string($link, trim($_POST['cat'])) . "',
		`title`       = '" . mysqli_real_escape_string($link, trim($_POST['title'])) . "',
		`text`        = '" . mysqli_real_escape_string($link, trim($_POST['text'])) . "',
		`description` = '" . mysqli_real_escape_string($link, trim($_POST['description'])) . "',
		`price`       = '" . mysqli_real_escape_string($link, trim($_POST['price'])) . "'
		WHERE `id`    = " . (int)$_GET['id'] . "
	");

    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /admin/goods');
    exit();
}

//Добавление изображений к товарам:
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
