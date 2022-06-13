<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <form action="" method="post">
                <div>
                    <h4>Заголовок новости *:</h4>
                    <input type="text" class="form-control" name="title" value="<?=
                     htmlspecialchars($_POST['title'] ?? ''); ?>">
                </div>
                <div>
                    <h4>Категория новости (выберите из списка):</h4>
                    <select class="form-control" name="cat" selected="selected">
                        <?php
                        $category = [
                                'Функционал сайта',
                                'Новые поступления, новинки',
                                'Информация для поставщиков',
                                'Информация для оптовых покупателей',
                                'Информация для розничных покупателей',
                        ];
                        //wtf($category);

                        foreach ($category as $v) {
                            echo '<option>'.htmlspecialchars($v).'</option>';
                        } ?>
                    </select>
                </div>
                <div>
                    <h4>Описание новости:</h4>
                    <textarea class="form-control" name="description"><?=
                         htmlspecialchars($_POST['description'] ?? ''); ?></textarea>
                </div>
                <div>
                    <h4>Полный текст новости:</h4>
                    <textarea class="form-control" name="text"><?=
                         htmlspecialchars($_POST['text'] ?? '');?></textarea>
                </div>
                <br>
                <input class="btn btn-primary" type="submit" name="add" value="Добавить новость">
            </form>
            <br>
        </div>
    </div>
</div>
<?php } ?>
