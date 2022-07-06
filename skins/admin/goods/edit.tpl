<?php
/**
 * @var $row array
 */
?>
<div class="row">
    <div class="form-group">
        <div>
            <img class="rounded float-left" src="/uploaded/goods/<?=htmlspecialchars($row['img'] ?? '');?>"
                 alt="Card image cap"
                 style="width:350px">
        </div>
        <div>
            <form action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="MAX_FILE_SIZE" value="50000000"/>
                <input type="file" class="btn btn-light" name="file">
                <input type="submit" name="submit" class="btn btn-light" value="Загрузить файл">
            </form>
        </div>
        <form action="" method="post">
            <div>
                Название товара *:
                <input type="text" class="form-control" name="title" value="<?=
                     htmlspecialchars($row['title']); ?>">
            </div>
            <div>
                Категория товара (выберите из списка):
                <select class="form-control" name="cat" selected="selected">
                    <?php
                    $category = [
                            'Азотные удобрения',
                            'Фосфорные удобрения',
                            'Калийные удобрения',
                            'Комплексные минеральные удобрения',
                    ];

                    foreach ($category as $v) {
                        echo '<option>'.htmlspecialchars($v).'</option>';
                    } ?>
                </select>

            </div>
            <div>
                Краткое описание товара:
                <textarea class="form-control" name="description"><?=
                         htmlspecialchars($row['description']); ?></textarea>
            </div>
            <div>
                Полный текст товара:
                <textarea class="form-control" name="text"><?=
                         htmlspecialchars($row['text']); ?></textarea>
            </div>
            <div>
                Цена товара:
                <input type="text" class="form-control" name="price" value="<?=
                     htmlspecialchars($row['price']); ?>">
            </div>
            <br>
            <input type="submit" name="ok" class="btn btn-success" value="Сохранить изменения">
            <a class="btn btn-secondary" href="/admin/goods/full?id=<?= $row['id'];?>">Вернуться</a>
        </form>
    </div>
</div>
