<?php
if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
    <div class="container mt-4">
        <div class="row">
            <div class="form-group">
                <form action="" method="post">
                    <div>
                        <h4>Название товара *:</h4>
                        <input type="text" class="form-control" name="title" value="<?=
                        htmlspecialchars($_POST['title'] ?? '');?>">
                    </div>
                    <div>
                        <h4>Категория товара (выберите из списка):</h4>
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
                        <h4>Краткое описание товара:</h4>
                        <textarea class="form-control" name="description"><?=
                            htmlspecialchars($_POST['description'] ?? '');?></textarea>
                    </div>
                    <div>
                        <h4>Полный текст товара:</h4>
                        <textarea class="form-control" name="text"><?=
                            htmlspecialchars($_POST['text'] ?? '');?></textarea>
                    </div>
                    <div>
                        <h4>Цена товара:</h4>
                        <input type="text" class="form-control" name="price" value="<?=
                        htmlspecialchars($_POST['price'] ?? '');?>">
                    </div>
                    <br>
                    <input type="submit" name="add" class="btn btn-primary" value="Добавить товар">
                </form>
                <br>
            </div>
        </div>
    </div>
<?php
} ?>
