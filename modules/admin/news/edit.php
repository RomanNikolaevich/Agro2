<?php
/**
 * @var $link
 */
if(isset($_POST['ok'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['description'])) {
    mysqli_query($link, "
		UPDATE `news` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`date`        = NOW()
		WHERE `news`.`id` = ".(int)$_GET['id']."
	") or exit(mysqli_error());

    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /admin/news');
    exit();
}

$news = mysqli_query($link,"
	SELECT *
	FROM `news`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	") or exit(mysqli_error());

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
