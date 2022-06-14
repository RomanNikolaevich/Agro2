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
    header("Location: /admin/goods");
    exit();
}

//Удаление товара
if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `goods`
		WHERE `id` = ".(int)$_GET['id']."
	");
    $_SESSION['info'] = 'Товар id = '.$_GET['id'].' успешно удален';
    header("Location: /admin/goods");
    exit();
}

//вывод товаров из БД в main.tpl
$goods = q("
    SELECT *
    FROM `goods`
    ORDER BY `id` DESC
");

//выводим сообщение и чистим сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
