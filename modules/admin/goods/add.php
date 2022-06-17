<?php
/*echo 'Привет Станислав';
exit;*/
if(isset($_POST['add'], $_POST['title'], $_POST['text'], $_POST['cat'],
    $_POST['description'], $_POST['price'])) {
    q("
		INSERT INTO `goods` SET
		`cat` 		  = '".mysqli_real_escape_string($link, trim($_POST['cat']))."',
		`title` 	  = '".mysqli_real_escape_string($link, trim($_POST['title']))."',
		`text` 		  = '".mysqli_real_escape_string($link, trim($_POST['text']))."',
		`description` = '".mysqli_real_escape_string($link, trim($_POST['description']))."',
		`price`       = '".mysqli_real_escape_string($link, trim($_POST['price']))."'
	");
    $_SESSION['info'] = 'Товар был добавлен';
    header('Location: /admin/goods');
    exit();
}
