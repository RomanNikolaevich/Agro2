<?php

//удаление новостей помеченных чекбоксом:
if (isset($_POST['delete'])){
    foreach ($_POST['ids'] as $k => $v) {
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',', $_POST['ids']);
    q("
			DELETE FROM `books`
			WHERE `id` IN (".$ids.")
		");
    q("
		DELETE FROM `books2books_author`
		WHERE `books2books_author`.`book_id` = '".(int)$_GET['id']."'
	");
    $_SESSION['info'] = 'Книги были удалены';
    header("Location: /admin/books");
    exit();
}

//удаление книги
if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `books`
		WHERE `books`.`id` = '".(int)$_GET['id']."'
	");
    q("
		DELETE FROM `books2books_author`
		WHERE `books2books_author`.`book_id` = '".(int)$_GET['id']."'
	");
    $_SESSION['info'] = 'Книга id = '.$_GET['id'].' успешно удалена';
    header("Location: /admin/books");
    exit();
}

//Создаем заготовку новой книги с пустым содержанием
if(isset($_POST['addbook'])) {
//находим максимальный последний id в БД книг
    $maxID = q("
            SELECT MAX(`id`)
            FROM `books`
    ");
    $rowID = implode(mysqli_fetch_assoc($maxID));
    //увеличиваем его на 1
    $rowID=++$rowID;

    q("
        INSERT INTO `books` SET
        `id` = '".mres(trim($rowID))."'
    ");
    header("Location: /admin/books/add?id=$rowID");
    exit();
}

//Выбор авторов в виде выпадающего списка
$booksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `id`
    ");

//вывод книг согласно категорий из БД в main.tpl
if (isset($_POST['search'])) {
    $author = $_POST['author'];
    $books = q("
        SELECT *
        FROM `books`
        WHERE `cat` = '".$author."'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['reset'])) {
    header("Location: /admin/books");
    exit();
} else {
    $books = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
}

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
