<?php

//вывод книг согласно авторам или все из БД в main.tpl
if (isset($_POST['searchselect'])) {
    $author = $_POST['selectauthor']; // Выбираем Заяц
    //получаем идентификатор автора
    $res1 = q("
        SELECT `id`
        FROM `books_author`
        WHERE `name` = '" . mres($author) . "'
    ");
    $row1 = $res1->fetch_assoc();
    //wtf($row1,1);
    if (empty($row1)) {
        $error = 'Вы не выбрали ничего в фильтре';
        $books = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
    } else {
        foreach ((array)$row1['id'] as $k1 => $v1) {
            $row['id'][$k1] = (int)$v1;
        }
        //$ids1 = (implode(',', $row1));
        //делаем запрос на получение идентификатор книги или книг этого автора
        $res2 = q("
        SELECT `book_id`
        FROM `books2books_author`
        WHERE `author_id` = '" . mres($row1['id']) . "'
    ");
        //получаем список идентификаторов книг автора в виде массива
        $ids2 = [];
        while ($row2 = $res2->fetch_assoc()) {
            $ids2[] = $row2['book_id'];
        }
        //получаем список идентификаторов книг автора в виде строки
        $ids3 = (implode(',', $ids2));
        //wtf($ids3,1);
        //получаем список книг автора из селектора
        if (empty($ids3)) {
            $error = 'У этого автора нет книг в нашем магазине';
            $books = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
        } else {
            $books = q("
        SELECT *
        FROM `books`
        WHERE `id` IN ($ids3)
        ORDER BY `id` DESC
    ");
        }
    }

} elseif (isset($_POST['searchsubmit'], $_POST['searchbooks']) && !empty($_POST['searchbooks'])) {
    $search = $_POST['searchbooks'];
    $books = q("
        SELECT *
        FROM `books`
        WHERE `text` LIKE '%" . mres($search) . "%'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['reset'])) {
    header("Location: /books");
    exit();
} else {
    $books = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
}

//Вывод связей книг с автором в виде 'ФИО':
function booksMainShowAuthor($rowID)
{
    $i = 0;
    //запрос к БД связей - по id книги получаем id авторов:
    $res = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` = '" . (int)$rowID . "'
    ");
    //wtf($res);
    //++$i;
    while ($row = $res->fetch_assoc()) {
        //Запрос к БД авторов для получения ФИО автора по идентификатору:
        $res2 = q("
            SELECT `name`
            FROM `books_author`
            WHERE `id` = '" . (int)$row['author_id'] . "'
        ");
        $row2 = $res2->fetch_assoc();
        echo ++$i . ')' . $row2['name'] . ', ' . '<br>';
        //echo ++$i.'<br>';
    }
}

//Выбор авторов в виде выпадающего списка
$booksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `id`
    ");

//делаем проверку сессии
if (isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
