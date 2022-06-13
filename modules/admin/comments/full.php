<?php
/**
 * @var $link
 */

//Вывод отзывов на экран:
$comments = q("
    SELECT *
    FROM `comments`
    ORDER BY `id` DESC
");

$row = mysqli_fetch_assoc($comments);
