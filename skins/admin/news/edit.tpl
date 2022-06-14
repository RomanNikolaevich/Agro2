<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <form action="" method="post">
                <div>
                    Заголовок новости *:
                    <input type="text" class="form-control" name="title" value="<?=
                    htmlspecialchars($row['title']); ?>">
                </div>
                <div>
                    Категория новости (выберите из списка):
                    <select class="form-control" name="cat" selected="selected">
                        <?php
                        hsc($category = [
                                'Функционал сайта',
                                'Новые поступления, новинки',
                                'Информация для поставщиков',
                                'Информация для оптовых покупателей',
                                'Информация для розничных покупателей',
                        ]);
                        //wtf($category);

                        foreach ($category as $v) {
                            echo '<option>'.htmlspecialchars($v).'</option>';
                        } ?>
                    </select>
                </div>
                <div>
                    Описание новости:
                    <textarea class="form-control" name="description"><?=
                        htmlspecialchars($row['description']); ?></textarea>
                </div>
                <div>
                    Полный текст новости:
                    <textarea class="form-control" name="text"><?= htmlspecialchars($row['text']); ?></textarea>
                </div>
                <input type="submit" name="ok" value="Сохранить изменения">
            </form>
        </div>
    </div>
</div>
<?php } ?>

