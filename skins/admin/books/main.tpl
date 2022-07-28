<?php

/**
 * @var $booksAuthorShow array
 * @var $books array
 */

?>
<div class="container mt-4">
    <?php
    if (isset($info)) { ?>
        <h2><?php
            echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
        <?php
    } ?><br>
    <h3> Книги: </h3>
    <form action="" method="post">
        <div>
            <a class="btn btn-info" href="/admin/books/author">Редактор авторов</a>
            <!--<a class="btn btn-success" href="/admin/books/add">Добавить книгу</a>-->
            <input class="btn btn-success" type="submit" name="addbook" value="Добавить книгу">
            <input class="btn btn-danger" type="submit" name="delete" value="Удалить отмеченные книги">
        </div>

        <table class="mytable">
            <tr class="mytable-header">
                <th colspan="5" style="text-align: center;">Фильтр книг по авторам</th><!--растягивает ячейку на ширину трех нижних-->
                <th colspan="1" style="text-align: center;">Поиск</th>
                <th colspan="1" style="text-align: center;">Сброс</th>
            </tr>
            <tr >
                <th colspan="5" style="text-align: center;">
                    <?php
                    echo '<select class="form-control" name="selectAuthor" selected="selected">'; //форма для выбора
                    echo '<option value=""></option>';//пустая опция
                    while ($row = $booksAuthorShow->fetch_assoc()) {
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
                <th colspan="4" style="text-align: center;">Книги</th><!--растягивает ячейку на ширину трех нижних-->
                <th colspan="2" style="text-align: center;">Редактирование книг</th>
            </tr>
            <tr class="mytable-header" style="text-align: center;">
                <th>id</th>
                <th>название</th>
                <th>автор</th>
                <th>описание</th>
                <th>edit</th>
                <th>delete</th>
            </tr>
            <?php while($row = $books->fetch_assoc()) { ?>
                <tr style="font-family:Tahoma, sans-serif, font-size:13px; text-align: justify;">
                    <td class="">
                        <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
                    </td>
                    <td class="">
                        <?= (int)$row['id']; ?>
                    </td>
                    <td style="text-align:left; width: 280px;">
                        <?= hsc($row['name']); ?>
                    </td>
                    <td style="text-align:left; width: 280px;">
                        <?= hsc(booksMainShowAuthor($row['id']) ?? ''); ?>
                    </td>
                    <td class="">
                        <?= hsc(mb_strimwidth($row['text'], 0, 150, "...")); ?>
                        <a class="" style="text-decoration: none;" href="/admin/books/full?id=<?= (int)$row['id'];
                        ?>">(полная версия)</a>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/books/edit?id=<?= (int)$row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/books/main?action=delete&id=<?= (int)$row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </form>
</div>
<div class="more-free-space">

</div>
