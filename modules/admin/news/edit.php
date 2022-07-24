<?php
/**
 * @var $link
 */

$id = (int)$_GET['id'];

if(isset($_POST['ok'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['description'])) {
    q("
		UPDATE `news` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`date`        = NOW()
		WHERE `news`.`id` = ".$id."
	");

    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /admin/news');
    exit();
}

$news = q("
	SELECT *
	FROM `news`
	WHERE 	`id` = ".$id."
	Limit 1
	");

if(!mysqli_num_rows($news)) {
    $_SESSION['info'] = 'Данной новости не существует!';
    header("Location: /admin/news");
    exit();
}

$row = mysqli_fetch_assoc($news);
//wtf($row); //видим нашу новости в виде массива

if(isset($_POST['title'])) {
    $row['title'] = $_POST['title'];
}

//Выбор категории новостей в виде выпадающего списка
$newsCatShow = q("
    SELECT *
    FROM `news_cat`
    ORDER BY `id`
    ");

$newsCatFromDB = q("
    SELECT `name`
    FROM `news_cat`
    WHERE `id` = ".$id."
    ");

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
        UPDATE `news` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
    header("Location: /admin/news/edit?id=$id");
    exit();
}
