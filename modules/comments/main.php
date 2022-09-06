<?php
/**
 * @var $link
 */

//Блок Пагинатора:
//Поверка, есть ли GET запрос
$pageno = $_GET['pageno'] ?? 1;
// LIMIT задаёт лимит записей
$limit = 5;
//OFFSET задает количество строк, которые нужно пропустить.
$offset = ($pageno - 1) * $limit;

//выводим отзывов из БД на страницу с учетом пагинатора
$commentQuery = "SELECT * FROM `comments` ORDER BY `date` DESC LIMIT $limit OFFSET $offset";
$commentResult = q($commentQuery);
$comments = mysqli_fetch_all($commentResult, MYSQLI_ASSOC);//MYSQLI_ASSOC указывает на тип массива


//счетчик отзывов:
$commentResult = q("SELECT * FROM `comments` WHERE `active` = 1"); //запрос к БД отзывов
$commentCount = mysqli_num_rows($commentResult); // Получаем количество строк в БД

//Считаем количество страниц:
$totalPages = ceil($commentCount / $limit);
//Для расчета нумерации отзывов с учетом смены страниц пагинатором.
$currentCommentNumber = $commentCount - $offset;
