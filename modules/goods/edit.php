<?php
/**
 * @var $link
 */
if(isset($_POST['ok'], $_POST['title'], $_POST['text'], $_POST['cat'], $_POST['price'], $_POST['description'])) {
    $sql = "
		UPDATE `goods` SET
		`cat`         = '" . mysqli_real_escape_string($link, trim($_POST['cat'])) . "',
		`title`       = '" . mysqli_real_escape_string($link, trim($_POST['title'])) . "',
		`text`        = '" . mysqli_real_escape_string($link, trim($_POST['text'])) . "',
		`description` = '" . mysqli_real_escape_string($link, trim($_POST['description'])) . "',
		`price`       = '" . mysqli_real_escape_string($link, trim($_POST['price'])) . "'
		WHERE `id`    = " . (int)$_GET['id'] . "
	";
    //dd($sql);
    mysqli_query($link, $sql) or exit(mysqli_error());

    $_SESSION['info'] = 'Запись была изменена';
    header('Location: /goods');
    exit();
}

$goods = mysqli_query($link,"
	SELECT *
	FROM `goods`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	") or exit(mysqli_error());

if(!mysqli_num_rows($goods)) {
    $_SESSION['info'] = 'Данного товара не существует!';
    header("Location: /goods");
    exit();
}

$row = mysqli_fetch_assoc($goods);

if(isset($_POST['title'])) {
    $row['title'] = $_POST['title'];
}

if(isset($_POST['cat'])) {
    $row['cat'] = $_POST['cat'];
}
