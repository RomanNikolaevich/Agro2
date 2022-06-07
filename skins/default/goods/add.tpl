<div class="row">
    <div class="form-group">
        <form action="" method="post">
            <div>
                Название товара *:
                <input type="text" class="form-control" name="title" value="<?=
                htmlspecialchars($_POST['title'] ?? '');?>">
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
                    htmlspecialchars($_POST['description'] ?? '');?></textarea>
            </div>
            <div>
                Полный текст товара:
                <textarea class="form-control" name="text"><?=
                    htmlspecialchars($_POST['text'] ?? '');?></textarea>
            </div>
            <div>
                Цена товара:
                <input type="text" class="form-control" name="price" value="<?=
                htmlspecialchars($_POST['price'] ?? '');?>">
            </div>
            <br>
            <input type="submit" name="add" class="btn btn-success" value="Добавить товар">
        </form>
    </div>
</div>
