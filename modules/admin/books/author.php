<?php

//Выбор категории новостей в виде выпадающего списка
$booksAuthorShow = q("
    SELECT *
    FROM `books_author`
    ORDER BY `name`
    ");

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

//редактирование категорий для новостей
if (isset($_POST['showauthor'], $_POST['editauthor'], $_POST['editauthorsubmit'])) {
    if (!empty($_POST['showauthor'])) {
        if (!empty($_POST['editauthor'])) {
            if(preg_match($pattern, $_POST['editauthor'])) {
                $oldname = trimAll($_POST['showauthor']);
                $newname = trimAll($_POST['editauthor']);
                q("
            UPDATE `books_author` SET
            `name` = '" . mres($newname) . "'
            WHERE `name` = '" . mres($oldname) . "';
        ");
                header('Location: /admin/books/author');
                exit();
            } else {
                $error2 = 'Данная запись не соотвествует шаблону!';
            }
        } else {
            $error2 = 'Заполните пожалуйста поле для редактирования автора';
        }
    } else {
        $error2 = 'Выберите автора для редактирования';
    }
}

//удаление категории
if (isset($_POST['showauthor'], $_POST['deletecatsubmit'])) {
        $var = $_POST['showauthor'];
        q("
            DELETE FROM 
            `books_author`
            WHERE `books_author`.`name` = '$var';
    ");
        header('Location: /admin/books/author');
        exit();
}
