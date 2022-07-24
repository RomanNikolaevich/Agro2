<?php

//удаление новостей помеченных чекбоксом:
if (isset($_POST['delete'])){
    foreach ($_POST['ids'] as $k => $v) {
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',', $_POST['ids']);
    q("
			DELETE FROM `news`
			WHERE `id` IN (".$ids.")
		");
    $_SESSION['info'] = 'Новости были удалены';
    header("Location: /admin/news");
    exit();
}

//удаление новости
if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `news`
		WHERE `id` = ".(int)$_GET['id']."
	");
    $_SESSION['info'] = 'Новость id = '.$_GET['id'].' успешно удалена';
    header("Location: /admin/news");
    exit();
}

//Выбор категории новостей в виде выпадающего списка
$newsCatShow = q("
    SELECT *
    FROM `news_cat`
    ORDER BY `id`
    ");

//вывод новостей согласно категорий из БД в main.tpl
if (isset($_POST['search'])) {
    $cat = $_POST['cat'];
    $news = q("
        SELECT *
        FROM `news`
        WHERE `cat` = '".$cat."'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['reset'])) {
    header("Location: /admin/news");
    exit();
} else {
    $news = q("
        SELECT *
        FROM `news`
        ORDER BY `id` DESC
    ");
}



//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
//wtf($_GET, 1);
