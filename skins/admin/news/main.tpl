<?php

/**
* @var $news array
 *@var $newsCatShow
*/

?>
<div class="container mt-4">
    <?php
    if (isset($info)) { ?>
        <h2><?php
            echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
        <?php
    } ?><br>
    <h3> Все существующие новости: </h3>
    <form action="" method="post">
    <div>
        <a class="btn btn-info" href="/admin/news/cat">Редактор категорий</a>
        <a class="btn btn-success" href="/admin/news/add">Добавить новость</a>
        <input class="btn btn-danger" type="submit" name="delete" value="Удалить отмеченные записи">
    </div>

        <table class="mytable">
            <tr class="mytable-header">
                <th colspan="7" style="text-align: center;">Фильтр новостей по категориям</th><!--растягивает ячейку на ширину трех нижних-->
                <th colspan="1" style="text-align: center;">Поиск</th>
                <th colspan="1" style="text-align: center;">Сброс</th>
            </tr>
            <tr >
                <th colspan="7" style="text-align: center;">
                    <?php
                    echo '<select class="form-control" name="cat" selected="selected">'; //форма для выбора
                    echo '<option value=""></option>';//пустая опция
                    while ($row=$newsCatShow->fetch_assoc()) {
                        echo '<option value="'.hsc($row['name']).'">'.hsc($row['name']).'</option>';
                    }
                    echo '</select>';
                    ?>
                </th><!--растягивает ячейку на ширину трех нижних-->
                <th colspan="1" style="text-align: center;">
                    <!--<input type="image" name="search" style="width:40px" src="/skins/admin/img/view.png" alt="">-->
                    <input type="submit" name="search" value="search" class="btn btn-primary">

                </th>
                <th colspan="1" style="text-align: center;">
                    <!--<input type="image" name="reset" style="width:35px" src="/skins/admin/img/reset.png" alt="">-->
                    <input type="submit" name="reset" value="reset" class="btn btn-secondary">
                </th>
            </tr>
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
                        <?= (int)$row['id']; ?>
                    </td>
                    <td class="">
                        <?= hsc($row['date']); ?>
                    </td>
                    <td class="">
                        <?= hsc($row['title']); ?>
                    </td>
                    <td class="">
                        <?= hsc($row['cat']); ?>
                    </td>
                    <td class="">
                        <?= hsc(mb_strimwidth($row['description'], 0, 150, "...")); ?>
                        <a class="" style="text-decoration: none;" href="/admin/news/full?id=<?= (int)$row['id'];
                        ?>">(полная версия)</a>
                    </td>
                    <td class="">
                        <?= hsc(mb_strimwidth($row['text'], 0, 150, "...")); ?>
                        <a class="" style="text-decoration: none;" href="/admin/news/full?id=<?= (int)$row['id'];
                        ?>">(полная версия)</a>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/news/edit?id=<?= (int)$row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/news/main?action=delete&id=<?= (int)$row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </form>
</div>
<div class="more-free-space">

</div>

