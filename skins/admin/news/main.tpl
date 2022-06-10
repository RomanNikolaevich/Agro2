<?php

/**
 * @var $news array
 */

if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
    <div class="container mt-4">
        <?php
        if (isset($info)) { ?>
            <h1><?php
                echo $info; ?></h1> <!--уведомление, о добавлении новой записи-->
            <?php
        } ?><br>
        <h3> Все существующие новости: </h3>
        <div class="more-free-space">
            <a class="btn btn-primary" href="/admin/news/add">Добавить новость</a>
            <input class="btn btn-danger" type="submit" name="delete" value="Удалить отмеченные записи">
        </div>
        <form action="" method="post">
            <?php
            while ($row = mysqli_fetch_assoc($news)) { ?>
                <div class="card mb-3">
                    <div class="card-body">
                        <input type="checkbox" name="ids[]" value="<?php
                        echo $row['id']; ?>">
                        <a class="btn btn-warning" href="/admin/news/edit&id=<?php
                        echo $row['id'];
                        ?>">Изменить</a>
                        <a class="btn btn-danger" href="/admin/news&action=delete&id=<?php
                        echo $row['id'];
                        ?> ">Удалить</a>
                        <b><?php
                            echo $row['title']; ?></b> <!--вывод заглавия-->
                        <span style="color:#5c636a; font-size:10px;"><?=$row['date']?></span><!-- и даты, серым-->
                    </div>
                    <div class="card-footer">
                        <p><?php
                            echo $row['description']; ?></p>
                    </div>
                </div>
                <hr>
                <?php
            } ?>
        </form>
    </div>
    <div class="more-free-space">

    </div>
    <?php
} ?>
