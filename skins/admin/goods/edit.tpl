<?php
/**
 * @var $row array
 */
?>
<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
<div class="row">
    <div class="form-group">
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
                    hsc($category = [
                            'Азотные удобрения',
                            'Фосфорные удобрения',
                            'Калийные удобрения',
                            'Комплексные минеральные удобрения',
                    ]);

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
        </form>
    </div>
</div>
<?php } ?>

