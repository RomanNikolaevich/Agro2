<?php
/**
 * @var $link
 */

//Информацию из форм отправляем в БД:
if (isset($_POST['do_signup'])) {
    $errors = [];
	$username = $_SESSION['user']['login'];
    $comment = $_POST['comment'] ?? '';

    if (empty($comment)) {
        $errors['comment'] = 'Вы не заполнили отзыв';
    } elseif (mb_strlen($comment) < 50) {
        $errors['comment'] = 'Длинна отзыва меньше 50 символов!';
    }

	//Защита от спама со ссылками:
     validateName($comment);

    $commentArray = [

    ];

    if (!count($errors)) {
        $username = mres($username);
        $comment = mres($comment);
        $query = "INSERT INTO `comments` SET `name`='$username', `text`='$comment'";
        q($query);
        $_SESSION['commentOk'] = 'OK';
        header("Location: /comments");
        exit();
    }
}

//Блок Пагинатора:
//Поверка, есть ли GET запрос
$pageno = $_GET['pageno'] ?? 1;
// LIMIT задаёт лимит записей
$limit = 5;
//OFFSET задает количество строк, которые нужно пропустить.
$offset = ($pageno - 1) * $limit;

$comments = getComments($link, $limit, $offset);

//счетчик отзывов:
$commentResult = q("SELECT * FROM `comments` WHERE `active` = 1"); //запрос к БД отзывов
$commentCount = mysqli_num_rows($commentResult); // Получаем количество строк в БД

//Считаем количество страниц:
$totalPages = ceil($commentCount / $limit);
//Для расчета нумерации отзывов с учетом смены страниц пагинатором.
$currentCommentNumber = $commentCount - $offset;
