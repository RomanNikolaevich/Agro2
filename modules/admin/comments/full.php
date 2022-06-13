<?php
/**
 * @var $link
 */

//Вывод отзывов на экран:
$comments = q("
    SELECT *
    FROM `comments`
    WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
");

$row = mysqli_fetch_assoc($comments);
