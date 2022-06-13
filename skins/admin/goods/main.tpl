<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
    <h4 class="text-center"> Предлагаемая нами продукция: </h4>
    <?php
    if (isset($info)) { ?>
        <h2><?php
            echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
        <?php
    } ?><br>
    <div class="">
        <form method="post">
            <a class="btn btn-success" href="/admin/goods/add">Добавить товар</a>
            <button type="button" class="btn btn-danger" name="delete">Удалить товары</button>
        </form>
    </div>
    <form action="" method="post">
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
                        <?php echo $row['id']; ?>
                    </td>
                    <td class="">
                        <?php echo $row['title']; ?>
                    </td>
                    <td class="">
                        <?php echo $row['cat']; ?>
                    </td>
                    <td class="">
                        <?php echo mb_strimwidth($row['description'], 0, 150, "..."); ?>
                        <a class="" href="/admin/goods/full&id=<?php echo $row['id'];
                        ?>">(полная версия)</a>
                    </td>
                    <td class="">
                        <?php echo mb_strimwidth($row['text'], 0, 150, "..."); ?>
                        <a class="" href="/admin/goods/full&id=<?php echo $row['id'];
                        ?>">(полная версия)</a>
                    </td>
                    <td class="">
                        <?php echo $row['price']; ?>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/goods/edit&id=<?php echo $row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
                    </td>
                    <td class="" style="text-align: center;">
                        <a class="" href="/admin/goods&action=delete&id=<?php echo $row['id'];
                        ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </form>
<?php } ?>
