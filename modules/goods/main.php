<?php
//удаление товара:
if (isset($_POST['delete'])){
    foreach($_POST['ids'] as $k=>$v) {
        mysqli_query($link,"
		DELETE FROM `news`
		WHERE `id` = ".(int)$v."
	");
    }
}

if(isset($_GET['action']) && $_GET['action']=='delete'){
    mysqli_query($link,"
		DELETE FROM `goods`
		WHERE `id` = ".(int)$_GET['id']."
	") or exit(mysqli_error());
    $_SESSION['info'] = 'Товар успешно удален';
    header("Location: /goods");
    exit();
}

$goods = mysqli_query($link, "
SELECT *
FROM `goods`
ORDER BY `id` DESC
");

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}



