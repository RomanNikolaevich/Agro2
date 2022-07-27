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
                        <input class="form-control mr-sm-2" name="searchnews" type="search" placeholder="Поиск" aria-label="Search">
                    </div>
                    <div style="padding-bottom: 30px">
                        <input type="submit" name="searchsubmit" value="Поиск" class="btn btn-outline-success my-2 my-sm-0">
                        <input type="submit" name="reset" value="Сброс" class="btn btn-outline-success my-2 my-sm-0">
                    </div>
                    <div style="padding-bottom: 10px">
                        Фильтр книг по автору:
                        <?php
                        echo '<select class="form-control" name="cat" selected="selected">'; //форма для выбора
                        echo '<option>Выберите категорию для сортировки</option>';//пустая опция
                        while ($rowAuthor=$booksAuthorShow->fetch_assoc()) {
                            echo '<option value="'.hsc($rowAuthor['name']).'">'.hsc($rowAuthor['name']).'</option>';
                        }
                        echo '</select>';
                        ?>
                    </div>
                    <div>
                        <input type="submit" name="searchcat" value="Поиск" class="btn btn-outline-success my-2 my-sm-0">
                        <input type="submit" name="reset" value="Сброс" class="btn btn-outline-success my-2 my-sm-0">
                    </div>
                </div>
            </form>
        </div>
        <?php while($row=$books->fetch_assoc()) { ?>
        <div class="product col-md-4 col-sm-4 col-xs-12">
            <div style="padding:5px">
                <!--<h4>Заголовок книги: <?/*=htmlspecialchars($row['name'] ?? '');*/?></h4>-->
                <h5 class="card-title">
                    <a class="link-dark" style="text-decoration: none;"
                       href="/books/full?id=<?php
                       echo $row['id']; ?>"><?php echo hsc($row['name']); ?></a>
                </h5>
            </div>
            <div style="padding:5px;">
                <img src="/uploaded/books/<?=htmlspecialchars($row['img'] ?? '');?>"
                     alt="Card image cap" style="width:350px; float:left;">
            </div>
            <div style="padding:5px;">
               <!-- <p><b>Авторы: </b><br><?/*=//htmlspecialchars(booksShowAuthorMain () ?? ''); */?></p>-->
            </div>

            <div style="padding:5px">
                <p><b>Количество страниц: </b><?=htmlspecialchars($row['page'] ?? '');?></p>
            </div>
            <div style="padding:5px">
                <p><b>Год издания: </b><?=htmlspecialchars($row['year'] ?? '');?>г.</p>
            </div>
            <div style="padding:5px">
                <p><b>Цена: </b><?=htmlspecialchars($row['price'] ?? '');?> грн.</p>
            </div>
            <div style="padding:5px">
                <p><b>Описание книги: </b><?=
                    htmlspecialchars(mb_strimwidth($row['text'], 0, 100, "...")); ?></p>
            </div>
            <div style="padding-bottom:30px">
               <!-- <a class="btn btn-info" href="/admin/books/">К списку книг</a>-->
                <a class="btn btn-info" style="text-decoration: none;"
                   href="/books/full?id=<?php
                   echo $row['id']; ?>">Подробнее</a>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
