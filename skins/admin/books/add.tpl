<?php
/**
 * @var array $booksAuthorShow
 * @var int $id
 * @var array $books
 * @var array $author
 */
?>

<div class="container mt-4">
    <div class="row">
        <?php foreach ($books as $book) { ?>
        <div class="form-group" style="padding-bottom:30px;">
            <div style="padding-bottom:20px">
                <img class="rounded float-left" src="/uploaded/books/<?=htmlspecialchars($book['img'] ?? '');?>"
                     alt="Card image cap" style="width:350px">
            </div>
            <div style="padding-bottom:20px">
                <form action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="MAX_FILE_SIZE" value="50000000"/>
                    <input type="file" class="btn btn-light" name="file" accept="image/*">
                    <input type="submit" name="addimg" class="btn btn-light" value="Загрузить файл">
                </form>
            </div>
            <form method="post">
                <div style="padding-bottom:10px">
                    <h4>Выберите автора из списка:</h4>
                    <?php
                    echo '<select class="form-control" name="author" selected="selected">'; //форма для выбора
                    echo '<option value=""></option>';//пустая опция
                    foreach ($booksAuthorShow as $booksAuthor) {
                        echo '<option value="'.hsc($booksAuthor).'">'.hsc($booksAuthor).'</option>';
                    }
                    echo '</select>';
                    ?>
                </div>
                <div style="padding-bottom:20px">
                    <input class="btn btn-primary" type="submit" name="addauthor" value="Добавить автора в книгу" style="padding-top:10px">
                </div>
                <div style="padding-bottom:20px">
                    <h4>Авторы:</h4>
                    <p><?php if (isset($book['author'])) {
                            foreach ($book['author'] as $bookAuthor) {
                                echo $author[$bookAuthor].'<br>';
                            }
                        }?></p>
                </div>
                <div style="padding-bottom:10px">
                    <h4>Добавление нового автора в список авторов:</h4>
                    <p style="color:blueviolet">Допустимо использовать только буквы и дефисы, каждое новое
                        слово должно начинаться с большой буквы!</p>
                    <p style="color:red"><?= $error=$error ?? '' ?></p>
                    <input type="text" class="form-control" name="newauthor"
                           placeholder="Убедитесь, что такой автор отсутствует">
                </div>
                <div style="padding-bottom:20px">
                    <h4>Название книги *:</h4>
                    <input type="text" class="form-control" name="namebook" value="">
                </div>
                <div style="padding-bottom:20px">
                    <h4>Описание книги:</h4>
                    <textarea class="form-control" name="textbook"></textarea>
                </div>

                <div style="padding-bottom:20px">
                    <h4>Год выпуска:</h4>
                    <input type="number" class="form-control" name="year" value="">
                </div>
                <div style="padding-bottom:20px">
                    <h4>Количество страниц:</h4>
                    <input type="number" class="form-control" name="page" value="">
                </div>
                <div style="padding-bottom:20px">
                    <h4>Цена книги:</h4>
                    <input type="number" class="form-control" name="price" value="">
                </div>
                <br>
                <input class="btn btn-primary" type="submit" name="add" value="Добавить книгу">
                <!--<input type="submit" name="delete" class="btn btn-danger" value="Удалить заготовку">-->
                <a class="btn btn-danger" href="/admin/books/main?action=delete&id=<?= $id;
                ?>">Удалить заготовку</a>
                <a class="btn btn-info" href="/admin/books/">К списку книг, продолжить редактировать позднее</a>
            </form>
            <br>
        </div>
        <?php } ?>
    </div>
</div>
