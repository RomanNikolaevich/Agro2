<?php
/**
 * @var $link
 */

//Админские функции:
//Отобразить отзыв:
if(isset($_GET['action']) && $_GET['action']=='show'){
    q("
        UPDATE `comments` SET
       `active` = 1
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/comments");
    exit();
}

//Скрыть отзыв:
if(isset($_GET['action']) && $_GET['action']=='hide'){
    q("
        UPDATE `comments` SET
       `active` = 0
		WHERE `id` = ".(int)$_GET['id']."
	");
    header("Location: /admin/comments");
    exit();
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

//выводим сообщение и чистим сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
