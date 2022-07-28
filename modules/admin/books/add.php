<?php
$id = (int)$_GET['id'];

//Добавление изображений к товарам:
if (isset($_POST['addimg'])) {
    $uploader = new Uploader;
    $uploader->filePath=IMG_BOOKS;
    if($uploader->uploadFile($_FILES['file'])){
        $uploader->resize(350,350);
        $name=$uploader->name;
    } else {
        $errors['file'] = $uploader->error;
    }
    q("
        UPDATE `books` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
    header("Location: /admin/books/add?id=$id");
    exit();
}

//добавление связи "многие ко многим" между БД книги 'books' и БД авторы книг 'books_author'
if(isset($_POST['addauthor']) && !empty($_POST['author'])) {
    //ищем 'id' автора
    $author = $_POST['author'];
    $authorID= q("
        SELECT `id`
        FROM `books_author`
        WHERE 	`name` = '".$author."'
	");
    $rowID = implode(mysqli_fetch_assoc($authorID));
    q("
		INSERT INTO `books2books_author` SET
		`book_id` = '".mres(trim($id))."',
		`author_id` = '".mres(trim($rowID))."'
	");
    header("Location: /admin/books/add?id=$id");
    exit();
}

//добавление книги в базу книг
if(isset($_POST['add'])) {
    q("
		UPDATE `books` SET
		`name` 		  = '".mres(trim($_POST['namebook']))."',
		`text` 		  = '".mres(trim($_POST['textbook']))."',
		`year` 		  = '".mres(trim($_POST['year']))."',
		`page` 		  = '".mres(trim($_POST['page']))."',
		`price`       = '".mres(trim($_POST['price']))."'
		WHERE `id` = $id
	");
    header('Location: /admin/books'); //переадресацию на главную страничку на main
    exit();
}

//добавляем нового автора
$pattern = '#^(([А-ЯЁA-Z][а-яёa-z]+)*?\s?)+$#u';
if (isset($_POST['newauthor'], $_POST['newauthorsubmit'])) {
    if (!empty($_POST['newauthor'])) {
        if(preg_match($pattern, $_POST['newauthor'])) {
            $var = mres(trimAll($_POST['newauthor']));
            q("
            INSERT INTO 
            `books_author`(`name`)
            VALUES('" . $var . "');
            ");
            header('Location: /admin/books/author');
            exit();
        } else {
            $error = 'Данная запись не соотвествует шаблону!';
        }
    }
}

//Вывод данных по книге
$books = q("
	SELECT *
	FROM `books`
	WHERE 	`id` = ".$id."
	Limit 1
	");
$row = $books->fetch_assoc();

//Вывод авторов в виде выпадающего списка
$booksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `name`
    ");

//Вывод связей книг с автором в виде 'ФИО':
function booksAddAuthor () {
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
            WHERE `id` = ".$row['author']."
        ");
        $row2 = $res2->fetch_assoc();
        echo $row2['name'].'<br>';
    }
}

//удаление книги
if(isset($_GET['action']) && $_GET['action']=='delete'){
    q("
		DELETE FROM `books`
		WHERE `books`.`id` = '".$id."'
	");
    q("
		DELETE FROM `books2books_author`
		WHERE `books2books_author`.`book_id` = '".$id."'
	");
    $_SESSION['info'] = 'Книга id = '.$_GET['id'].' успешно удалена';
    header("Location: /admin/books");
    exit();
}
