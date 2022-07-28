<?php

//удаление новостей помеченных чекбоксом:
if (isset($_POST['delete'])){
    foreach ($_POST['ids'] as $k => $v) {
        $_POST['ids'][$k] = (int)$v;
    }
    $ids = implode(',', $_POST['ids']);
    q("
			DELETE FROM `books`
			WHERE `id` IN ('".$ids."')
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
    $author = $_POST['selectAuthor'];
    //получаем идентификатор автора
    $res1 = q("
        SELECT `id`
        FROM `books_author`
        WHERE `name` = '".hsc($author)."'
    ");
    $row1=$res1->fetch_assoc();
    //$row=implode($row);
    //wtf($row, 1);
    //получаем идентификатор книги или книг этого автора
    $res2 = q("
        SELECT `book_id`
        FROM `books2books_author`
        WHERE `author_id` IN ('".hsc($row1['id'])."')
    ");
    //получаем список книг автора из селектора
    while($row2=$res2->fetch_assoc()) {
        //wtf($row2, 1);
        $books = q("
        SELECT *
        FROM `books`
        WHERE `id` IN ('".hsc(($row2['book_id']))."')
        ORDER BY `id` DESC
    ");
    }

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

//Вывод связей книг с автором в виде 'ФИО':
function booksMainShowAuthor ($rowID) {
    //запрос к БД связей:
    $res = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` = '".$rowID."'
    ");
    while($row=$res->fetch_assoc()){
        //Запрос к БД авторов для получения ФИО автора по идентификатору:
        $res2 = q("
            SELECT `name`
            FROM `books_author`
            WHERE `id` = '".$row['author_id']."'
        ");
        $row2 = $res2->fetch_assoc();
        echo $row2['name'].', '.'<br>';
    }
}

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}