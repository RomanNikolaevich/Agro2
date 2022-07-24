<?php
/**
 * @var
 */

//Выбор категории новостей в виде выпадающего списка
$newsCatShow = q("
    SELECT *
    FROM `news_cat`
    ORDER BY `id`
    ");


//создаем новую категорию для новостей
if (isset($_POST['newcat'], $_POST['newcatsubmit'])) {
    if (!empty($_POST['newcat'])) {
        $var = $_POST['newcat'];
        q("
            INSERT INTO 
            `news_cat`(`name`)
            VALUES('$var');
    ");
        header('Location: /admin/news/cat');
        exit();
    }
}

//редактирование категорий для новостей
if (isset($_POST['showcat'], $_POST['editcat'], $_POST['editcatsubmit'])) {
    if (!empty($_POST['editcat'])) {
        $oldname = $_POST['showcat'];
        $newname = $_POST['editcat'];
        q("
            UPDATE `news_cat` SET
            `name` = '".mres($newname)."'
            WHERE `name` = '".mres($oldname)."';
        ");
        q("
            UPDATE `news` SET
            `cat` = '".mres($newname)."'
            WHERE `cat` = '".mres($oldname)."';
        ");
        header('Location: /admin/news/cat');
        exit();
    }
}

//удаление категории
if (isset($_POST['showcat'], $_POST['deletecatsubmit'])) {
        $var = $_POST['showcat'];
        q("
            DELETE FROM 
            `news_cat`
            WHERE `news_cat`.`name` = '$var';
    ");
        header('Location: /admin/news/cat');
        exit();
}
