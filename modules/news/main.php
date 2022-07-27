<?php

include_once './'.Core::$CONT.'/admin/security/blocked.php';


//Выбор категории новостей в виде выпадающего списка
$newsCatShow = q("
    SELECT *
    FROM `news_cat`
    ORDER BY `id`
    ");

//вывод новостей согласно категорий из БД в main.tpl
if (isset($_POST['searchcat'])) {
    $cat = $_POST['cat'];
    $news = q("
        SELECT *
        FROM `news`
        WHERE `cat` = '".$cat."'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['searchsubmit'], $_POST['searchnews']) && !empty($_POST['searchnews'])) {
    $search = $_POST['searchnews'];
    $news = q("
        SELECT *
        FROM `news`
        WHERE `text` LIKE '%".mres($search)."%'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['reset'])) {
    header("Location: /news");
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
