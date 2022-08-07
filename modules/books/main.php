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
    //если запрос пустой
    if (empty($row1)) {
        $error = 'Вы не выбрали ничего в фильтре';
        $books = q("
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
        //получаем список идентификаторов книг автора в виде строки
        $ids3 = (implode(',', $ids2));
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

//получаем идентификаторы книг в виде строки
while ($rowBooks = $books->fetch_assoc()) {
    $allBooks[$rowBooks['id']] = $rowBooks;
}
//wtf($rowBooks2,1); // вывод массива книг без авторов

//создаем массив авторов с ключом id книг
$resRelations = q("
    SELECT *
    FROM `books2books_author`
    ORDER BY `book_id` DESC
    ");

//Делаем запрос к БД авторов, чтобы вместо идентификатора вывести ФИО
$idAuthor2Name = q("
    SELECT *
    FROM `books_author`
");

//к массиву книг дописываем идентификаторы авторов
while($rowRelations = $resRelations->fetch_assoc()){
    $allBooks[$rowRelations['book_id']]['author_id'][$rowRelations['author_id']] = $rowRelations['author_id'];
    while($authorName = $idAuthor2Name->fetch_assoc()){
        //wtf($rowIdAuthor2Name);
        $allBooks[5]['author_id'][$authorName['id']]=$authorName['name'];

    }
}
//$allBooks[6]['author_id'][0]='Пушкин';
  wtf($allBooks,1);


/*while ($authorName = $idAuthor2Name->fetch_assoc()){
    //wtf($authorName);
}*/
    //$rowBooks2[] = $authorName;
    //wtf($rowBooks2,1);




/*$idss2 = (implode(',', $idss1));

$resRelations = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` IN (".$idss2.")
    ");
//wtf($resRelations,1);
while ($rowRelations = $resRelations->fetch_assoc()) {
    $rowRelations['book_id'] = $rowRelations['author_id'];
}
wtf($rowRelations,1);*/
//запрос к БД связей - по id книги получаем id авторов:
/*foreach($idss1 as $elem) {
    //wtf($elem);
    $i = 0;
    $resRelations = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` = '".$elem."'
    ");

    //получаем список идентификаторов авторов для этой книги в виде массива
    $idsxx = [];
    while ($rowRelations = $resRelations->fetch_assoc()) {
        $ids[] = $rowRelations['author_id'];
    }

    //получаем список идентификаторов авторов в виде строки
    $idsxx2 = (implode(',', $idsxx));

    //Запрос к БД авторов для получения ФИО автора по идентификатору:
    $resRelations2 = q("
            SELECT `name`
            FROM `books_author`
            WHERE `id` IN ('.$idsxx2.')
        ");
    //циклом выводим ФИО авторов на экран
    while($rowRelations2 = $resRelations2->fetch_assoc()) {
        $author =  ++$i . ')' . $rowRelations2['name'] . ', ' . '<br>';
    }
}*/



/*    $resRelations = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` IN ($idss2)
    ");

while ($rowRelations = $resRelations->fetch_assoc()) {
    $idss3[] = $rowRelations['author_id'];
}*/
//wtf($idss3,1);

//Вывод связей книг с автором в виде 'ФИО':
/*function booksMainShowAuthor($rowID)
{
    $i = 0;
    //запрос к БД связей - по id книги получаем id авторов:
    $res = q("
    SELECT *
    FROM `books2books_author`
    WHERE 	`book_id` = '" . (int)$rowID . "'
    ");

    //получаем список идентификаторов авторов для этой книги в виде массива
    $ids = [];
    while ($row = $res->fetch_assoc()) {
        $ids[] = $row['author_id'];
    }

    //получаем список идентификаторов авторов в виде строки
    $ids2 = (implode(',', $ids));

    //Запрос к БД авторов для получения ФИО автора по идентификатору:
    $res2 = q("
            SELECT `name`
            FROM `books_author`
            WHERE `id` IN ($ids2)
        ");
    //циклом выводим ФИО авторов на экран
    while($row2 = $res2->fetch_assoc()) {
        echo ++$i . ')' . $row2['name'] . ', ' . '<br>';
    }
}*/

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

//сделал возможность одним запросом выводить всех авторов по книгам
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
