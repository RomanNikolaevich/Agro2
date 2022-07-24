<?php
/**
 * @var $news array
 */
?>

<div class="container">
    <div class="row">
        <div class="col-3">
            <!-- Side navigation -->
            <form action="" method="post">
            <div class="sidebar">
                <div style="padding-bottom: 10px">
                        Поиск в новостой ленте:
                        <input class="form-control mr-sm-2" name="searchnews" type="search" placeholder="Поиск" aria-label="Search">
                </div>
                <div style="padding-bottom: 30px">
                    <input type="submit" name="searchsubmit" value="Поиск" class="btn btn-outline-success my-2 my-sm-0">
                    <input type="submit" name="reset" value="Сброс" class="btn btn-outline-success my-2 my-sm-0">
                </div>
                <div style="padding-bottom: 10px">
                    Фильтр новостей согласно категории:
                    <?php
                    echo '<select class="form-control" name="cat" selected="selected">'; //форма для выбора
                    echo '<option>Выберите категорию для сортировки</option>';//пустая опция
                    while ($row=$newsCatShow->fetch_assoc()) {
                        echo '<option value="'.hsc($row['name']).'">'.hsc($row['name']).'</option>';
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
        <div class="col-9">
            <!-- Page content -->
            <div class="main">
                <div style="padding:10px 40px 10px;">
                    <h3> Все существующие новости: </h3>
                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']!=BLOCKED) { ?>
                        <!-- Start "Видимый блок новостей для незабаненых пользователей" -->
                        <form action="" method="post">
                        <?php while($row = mysqli_fetch_assoc($news)) { ?>
                            <div>
                                <div style="padding:10px 40px 10px;">
                                    <img class="rounded float-left" src="/uploaded/goods/<?=htmlspecialchars($row['img'] ?? '');?>"
                                         alt="Card image cap" style="width:450px">
                                </div>
                                <div style="padding:10px 40px 10px;">
                                    <b><?= hsc($row['title']); ?></b> <!--вывод заглавия-->
                                    <span style="color:#5c636a; font-size:10px;"><?= hsc($row['date']) ?></span><!-- и даты, серым-->
                                </div>
                                <div style="padding:10px 40px 10px;">
                                    <p><?= hsc($row['description']); ?></p>
                                    <?= hsc(mb_strimwidth($row['text'], 0, 450, "...")); ?> <a class=""
                                                                                               style="text-decoration: none;" href="/news/full?id=<?= (int)$row['id']; ?>">(полная версия)</a>
                                </div>
                            </div>
                            <hr>
                            </form>
                            <!-- End "Видимый блок новостей для незабаненых пользователей" -->
                        <?php }
                    }?>
                </div>
            </div>
        </div>
    </div>
</div>
