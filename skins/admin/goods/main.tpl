<h4 class="text-center"> Предлагаемая нами продукция: </h4>
<?php
if (isset($info)) { ?>
    <h2><?php
        echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
    <?php
} ?><br>

<form action="" method="post">
    <div class="more-free-space">
        <a class="btn btn-success" href="/admin/goods/add">Добавить товар</a>
        <input class="btn btn-danger" type="submit" name="delete" value="Удалить товары">
    </div>
    <table class="mytable">
        <tr class="mytable-header">
            <th rowspan="2">
                <!-- th тег применяется для шапки таблицы-->
            </th>
            <th colspan="6" style="text-align: center;">Товары</th><!--растягивает ячейку на ширину трех нижних-->
            <th colspan="2" style="text-align: center;">Редактирование товаров</th>
        </tr>
        <tr class="mytable-header" style="text-align: center;">
            <th>id</th>
            <th>название</th>
            <th>категория</th>
            <th>описание</th>
            <th>текст</th>
            <th>цена</th>
            <th>edit</th>
            <th>delete</th>
        </tr>
        <?php while($row = mysqli_fetch_assoc($goods)) { ?>
            <tr style="font-family:Tahoma, sans-serif, font-size:13px; text-align: justify;">
                <td class="">
                    <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
                </td>
                <td class="">
                    <?= hsc($row['id']); ?>
                </td>
                <td class="">
                    <?= hsc($row['title']); ?>
                </td>
                <td class="">
                    <?= ($row['cat']); ?>
                </td>
                <td class="">
                    <?= hsc(mb_strimwidth($row['description'], 0, 150, "...")); ?>
                    <a class="" style="text-decoration: none;" href="/admin/goods/full?id=<?php echo $row['id'];
                    ?>">(полная версия)</a>
                </td>
                <td class="">
                    <?= hsc(mb_strimwidth($row['text'], 0, 150, "...")); ?>
                    <a class="" style="text-decoration: none;" href="/admin/goods/full?id=<?php echo $row['id'];
                    ?>">(полная версия)</a>
                </td>
                <td class="">
                    <?= (int)$row['price']; ?>
                </td>
                <td class="" style="text-align: center;">
                    <a class="" href="/admin/goods/edit?id=<?= $row['id'];
                    ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
                </td>
                <td class="" style="text-align: center;">
                    <a class="" href="/admin/goods/main?action=delete&id=<?= $row['id'];
                    ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
                </td>
            </tr>
        <?php } ?>
    </table>
</form>
