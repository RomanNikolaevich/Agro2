<?php

//удаление новости:
if (isset($_POST['delete'])){
/*    foreach($_POST['ids'] as $k=>$v) {
        q("
		DELETE FROM `news`
		WHERE `id` = ".(int)$v."
	");
    }*/
	//измененный код из 26-го урока
	foreach ($_POST['ids'] as $k => $v) {
		$_POST['ids']['$k'] = (int)$v;
	}
	$ids = implode('/', $_POST['ids']);
		q("
			DELETE FROM `news`
			WHERE `id` IN (".$ids.")
		");
	$_SESSION['info'] = 'Новости были удалены';
	header("Location: /news");
	exit();
}

//измененный код из 26-го урока:
if(isset($_GET['key1'], $_GET['key2']) && $_GET['key1']=='delete'){
    q("
		DELETE FROM `news`
		WHERE `id` = ".(int)$_GET['key2']."
	");
    $_SESSION['info'] = 'Новость была удалена';
    header("Location: /news");
    exit();
}

$news = q("
SELECT *
FROM `news`
ORDER BY `id` DESC
");

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
