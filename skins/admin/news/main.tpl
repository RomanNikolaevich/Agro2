<?php

/**
 * @var $news array
 */

if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
    <div class="container mt-4">
        <?php
        if (isset($info)) { ?>
            <h2><?php
                echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
            <?php
        } ?><br>
        <h3> Все существующие новости: </h3>
        <div class="more-free-space">
            <a class="btn btn-primary" href="/admin/news/add">Добавить новость</a>
            <input class="btn btn-danger" type="submit" name="delete" value="Удалить отмеченные записи">
        </div>
        <form action="" method="get">
            <table class="mytable">
                <tr class="mytable-header">
                    <th rowspan="2">
                        <!-- th тег применяется для шапки таблицы-->
                    </th>
                    <th colspan="6" style="text-align: center;">Содержимое новостей</th><!--растягивает ячейку на ширину трех нижних-->
                    <th colspan="2" style="text-align: center;">Редактирование новостей</th>
                </tr>
                <tr class="mytable-header" style="text-align: center;">
                    <th>id</th>
                    <th>дата</th>
                    <th>название</th>
                    <th>категория</th>
                    <th>описание</th>
                    <th>текст</th>
                    <th>edit</th>
                    <th>delete</th>
                </tr>
                <?php while($row = mysqli_fetch_assoc($news)) { ?>
                    <tr style="font-family:Tahoma, sans-serif, font-size:13px; text-align: justify;">
                        <td class="">
                            <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
                            <a href=""
                        </td>
                        <td class="">
                            <?php echo $row['id']; ?>
                        </td>
                        <td class="">
                            <?php echo $row['date']; ?>
                        </td>
                        <td class="">
                            <?php echo $row['title']; ?>
                        </td>
                        <td class="">
                            <?php echo $row['cat']; ?>
                        </td>
                        <td class="">
                            <?php echo mb_strimwidth($row['description'], 0, 150, "..."); ?>
                            <a class="" href="/admin/news/full&id=<?php echo $row['id'];
                            ?>">(полная версия)</a>
                        </td>
                        <td class="">
                            <?php echo mb_strimwidth($row['text'], 0, 150, "..."); ?>
                            <a class="" href="/admin/news/full&id=<?php echo $row['id'];
                            ?>">(полная версия)</a>
                        </td>
                        <td class="" style="text-align: center;">
                            <a class="" href="/admin/news/edit&id=<?php echo $row['id'];
                            ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
                        </td>
                        <td class="" style="text-align: center;">
                            <a class="" href="/admin/news&action=delete&id=<?php echo $row['id'];
                            ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </form>
    </div>
    <div class="more-free-space">

    </div>
    <?php
} ?>
