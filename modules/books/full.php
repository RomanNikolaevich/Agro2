<?php

$books = q("
	SELECT *
	FROM `books`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	");

$row = $books->fetch_assoc();

if(!$books->num_rows) {
    $_SESSION['info'] = 'Данной новости не существует!';
    header("Location: /admin/books");
    exit();
}

//Вывод связей книг с автором в виде 'ФИО':
function booksShowAuthor () {
    //запрос к БД связей:
    $id = (int)$_GET['id'];
    $res = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` = ".$id."
    ");
    while($row=$res->fetch_assoc()){
        //Запрос к БД авторов для получения ФИО автора по идентификатору:
        $res2 = q("
            SELECT `name`
            FROM `books_author`
            WHERE `id` = ".$row['author_id']."
        ");
        $row2 = $res2->fetch_assoc();
        echo $row2['name'].'<br>';
    }
}
