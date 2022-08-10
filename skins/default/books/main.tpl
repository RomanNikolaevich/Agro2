<?php
//Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/script.js?1"></script>';

/**
 * @var array $author
 * @var array $books
 * @var array $booksAuthorShow
 */
?>

<div class="container">
    <div style="text-align: center; padding-bottom:30px; padding-top:40px;">
        <h4> Книги по тематике удобрений</h4>
    </div>
    <div class="row">
        <div class="product col-md-4 col-sm-4 col-xs-12">
            <!-- Side navigation -->
            <form action="" method="post">
                <div class="sidebar">
                    <div style="padding-bottom: 10px">
                        Поиск книг по описанию:
                        <input class="form-control mr-sm-2" name="searchbooks" type="search" placeholder="Поиск" aria-label="Search">
                    </div>
                    <div style="padding-bottom: 30px">
                        <input type="submit" name="searchsubmit" value="Поиск" class="btn btn-outline-success my-2 my-sm-0">
                        <input type="submit" name="reset" value="Сброс" class="btn btn-outline-success my-2 my-sm-0">
                    </div>
                    <div style="padding-bottom: 10px">
                        Фильтр книг по автору:
                        <?php
                        echo '<select class="form-control" name="selectauthor" selected="selected">'; //форма для выбора
                        echo '<option>Выберите категорию для сортировки</option>';//пустая опция
                        foreach ($booksAuthorShow as $booksAuthor) {
                            echo '<option value="'.hsc($booksAuthor).'">'.hsc($booksAuthor).'</option>';
                        }
                        echo '</select>';
                        ?>
                    </div>
                    <div>
                        <input type="submit" name="searchselect" value="Поиск" class="btn btn-outline-success my-2 my-sm-0">
                        <input type="submit" name="reset" value="Сброс" class="btn btn-outline-success my-2 my-sm-0">
                    </div>
                </div>
            </form>
        </div>
        <?php foreach ($books as $book) { ?>
        <div class="product col-md-4 col-sm-4 col-xs-12">
            <div style="padding:5px">
                <h5 class="card-title">
                    <a class="link-dark" style="text-decoration: none;"
                       href="/books/full?id=<?php
                       echo $book['id']; ?>"><?php echo hsc($book['name']); ?></a>
                </h5>
            </div>
            <div style="padding:5px;">
                <img src="/uploaded/books/<?=htmlspecialchars($book['img'] ?? '');?>"
                     alt="Card image cap" style="width:350px; float:left;">
            </div>
            <div>
                <br><b>Авторы: </b><?php foreach($book['author'] as $bookAuthor) {
                    echo $author[$bookAuthor].'<br>';
                } ?>
            </div>
            <div style="padding:5px">
                <br><b>Количество страниц: </b><?=htmlspecialchars($book['page'] ?? '');?>
            </div>
            <div style="padding:5px">
                <br><b>Год издания: </b><?=htmlspecialchars($book['year'] ?? '');?>г.
            </div>
            <div style="padding:5px">
                <br><b>Цена: </b><?=htmlspecialchars($book['price'] ?? '');?> грн.
            </div>
            <div style="padding:5px">
                <br><b>Описание книги: </b><?=
                    htmlspecialchars(mb_strimwidth($book['text'], 0, 100, "...")); ?>
            </div>
            <div style="padding-bottom:30px">
               <!-- <a class="btn btn-info" href="/admin/books/">К списку книг</a>-->
                <a class="btn btn-info" style="text-decoration: none;"
                   href="/books/full?id=<?php
                   echo $book['id']; ?>">Подробнее</a>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<script>
    var error = '<?php echo $error; ?>';
    alert(error);
</script>
