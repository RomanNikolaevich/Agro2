<?php

//вывод книг согласно заданным авторам или все из БД в main.tpl
if (isset($_POST['searchselect'])) {
    $selectAuthor = $_POST['selectauthor']; // Выбираем Заяц
    //получаем идентификатор автора
    $res1 = q("
        SELECT `id`
        FROM `books_author`
        WHERE `name` = '" . mres($selectAuthor) . "'
    ");
    $row1 = $res1->fetch_assoc();
    $res1->close();
    //если запрос пустой
    if (empty($row1)) {
        $error = 'Вы не выбрали ничего в фильтре';
        $resBooks = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
   //если запрос не пустой
    } else {
        foreach ((array)$row1['id'] as $k1 => $v1) {
            $row['id'][$k1] = (int)$v1;
        }
        //делаем запрос к БД связей на получение идентификатор книги или книг этого автора
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
        $res2->close();
        //получаем список идентификаторов книг автора в виде строки
        $ids3 = (implode(',', $ids2));
        //получаем список книг автора из селектора
        if (empty($ids3)) {
            $error = 'У этого автора нет книг в нашем магазине';
            $resBooks = q("
                SELECT *
                FROM `books`
                ORDER BY `id` DESC
    ");
        } else {
            $resBooks = q("
                SELECT *
                FROM `books`
                WHERE `id` IN ($ids3)
                ORDER BY `id` DESC
            ");
        }
    }

} elseif (isset($_POST['searchsubmit'], $_POST['searchbooks']) && !empty($_POST['searchbooks'])) {
    $search = $_POST['searchbooks'];
    $resBooks = q("
        SELECT *
        FROM `books`
        WHERE `text` LIKE '%" . mres($search) . "%'
        ORDER BY `id` DESC
");
} elseif (isset($_POST['reset'])) {
    header("Location: /books");
    exit();
} else {
    $resBooks = q("
        SELECT *
        FROM `books`
        ORDER BY `id` DESC
    ");
}
//----------------создаем массив книг и авторов--------------
//получаем идентификаторы книг в виде строки
$idss = [];
while ($rowBooks = $resBooks->fetch_assoc()) {
    $books[$rowBooks['id']] = $rowBooks;
    $idss[] = $rowBooks['id'];
}
$resBooks->close();
$idss = (implode(',', $idss));
//wtf($idss,1); // вывод массива книг без авторов

//создаем массив авторов с ключом id книг
$resRelations = q("
    SELECT *
    FROM `books2books_author`
    WHERE `book_id` IN ($idss)
    ");

while($rowRelations = $resRelations->fetch_assoc()){
    $books[$rowRelations['book_id']]['author'][$rowRelations['author_id']] = $rowRelations['author_id'];
}
$resRelations->close();

//Делаем запрос к БД авторов, чтобы вместо идентификатора вывести ФИО
$resIdAuthor2Name = q("
    SELECT *
    FROM `books_author`
");

//создаем массива авторов книг
while($authorName = $resIdAuthor2Name->fetch_assoc()){
    $author[$authorName['id']]=$authorName['name'];
}
$resIdAuthor2Name->close();

//Выбор авторов в виде выпадающего списка (для фильтра авторов)
$resBooksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `id`
    ");
//делаем массив авторов для выпадающего меню (фильтра авторов)
while ($rowAuthor=$resBooksAuthorShow->fetch_assoc()) {
    $booksAuthorShow[$rowAuthor['id']] = $rowAuthor['name'];
}
$resBooksAuthorShow->close();

//делаем проверку сессии
if (isset($_SESSION['info'])) {
    $info = $_SESSION['info']; //передаем содержимое сессии в переменную инфо
    unset($_SESSION['info']); //удаляем сессию за ненужностью.
}

//сделал возможность одним запросом выводить всех авторов по книгам, но так как эту тему не проходили Стас отклонил.
/*$books2 = q("
        SELECT books.id as books_id,
               books_author.name as books_author_name
        FROM `books`
        LEFT JOIN books2books_author ON books2books_author.book_id=books.id
        LEFT JOIN books_author ON books2books_author.author_id=books_author.id
        ORDER BY `books_id` DESC
    ");
}

foreach ($books2 as $elem) {
    $resBooks[$elem['books_id']][] = $elem['books_author_name'];
}
wtf($resBooks,1);*/
