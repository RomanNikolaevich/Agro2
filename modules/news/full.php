<?php

include_once './'.Core::$CONT.'/admin/security/blocked.php';

$news = q("
	SELECT *
	FROM `news`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	");

if(!mysqli_num_rows($news)) {
    $_SESSION['info'] = 'Данной новости не существует!';
    header("Location: /news");
    exit();
}

$row = mysqli_fetch_assoc($news);
//wtf($row); //видим нашу новости в виде массива

if(isset($_POST['title'])) {
    $row['title'] = $_POST['title'];
}
