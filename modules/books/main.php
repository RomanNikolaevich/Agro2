<?php

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
    header("Location: /books");
    exit();
} else {
    $books = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
}

//Выбор авторов в виде выпадающего списка
$booksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `id`
    ");

//Вывод связей книг с автором в виде 'ФИО':
/*function booksShowAuthorMain (): void
{
    //запрос к БД связей:

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
            WHERE `id` = ".$row['author']."
        ");
        $row2 = $res2->fetch_assoc();
        echo $row2['name'].'<br>';
    }
}*/

//делаем проверку сессии
if(isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}
