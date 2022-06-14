<?php
//удаление товаров помеченных чекбоксом:
if (isset($_POST['delete'])){
    foreach ($_POST['ids'] as $k => $v) {
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',', $_POST['ids']);
    q("
			DELETE FROM `goods`
			WHERE `id` IN (".$ids.")
		");
    $_SESSION['info'] = 'Товары были удалены';
    header("Location: /goods");
    exit();
}

if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `goods`
		WHERE `id` = ".(int)$_GET['id']."
	");
    $_SESSION['info'] = 'Товар успешно удален';
    header("Location: /goods");
    exit();
}

$goods = q("
    SELECT *
    FROM `goods`
    ORDER BY `id` DESC
    ");

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}



