<?php
/**
 * @var $link
 */

//Админские функции:
//Скрыть отзыв:
if (isset($_POST['hidecomment'])){
    q("
        UPDATE `comments` SET
       `active` = 0
		WHERE `id` = ".(int)$_GET['id']."
    ");
    header("Location: /admin/comments");
}

//Разрешить отзыв:
if (isset($_POST['showcomment'])){
    q("
        UPDATE `comments` SET
       `active` = 1
		WHERE `id` = ".(int)$_GET['id']."
    ");
    header("Location: /admin/comments");
}

//Вывод отзывов на экран:
$comments = q("
    SELECT *
    FROM `comments`
    ORDER BY `id` DESC
");

//счетчик всех отзывов:
$commentCountAll = mysqli_num_rows($comments); // Получаем количество строк в БД

//счетчик отобренных отзывов:
$commentResult = q("SELECT * FROM `comments` WHERE `active` = 1"); //запрос к БД отзывов
$commentCount = mysqli_num_rows($commentResult); // Получаем количество строк в БД



