<?php
/**
 * @var $link
 */

$id = $_GET['id'];
//Добавление изображений к товарам:
if (isset($_POST['submit'])) {

    $uploader = new Uploader;
    $uploader->filePath=IMG_GOODS;
    if($uploader->uploadFile($_FILES['file'])){
        $uploader->resize(450,450);
        $name=$uploader->name;
    } else {
        $errors['file'] = $uploader->error;
    }
    q("
        UPDATE `goods` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
}


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
