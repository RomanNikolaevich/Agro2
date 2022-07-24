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
                    <?php
                    echo '<select class="form-control" name="cat" selected="selected">'; //форма для выбора
                    echo '<option value=""></option>';//пустая опция
                    while ($row=$newsCatShow->fetch_assoc()) {
                        echo '<option value="'.hsc($row['name']).'">'.hsc($row['name']).'</option>';
                    }
                    echo '</select>';
                    ?>
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
                <a class="btn btn-info" href="/admin/news/">К списку новостей</a>
            </form>
            <br>
        </div>
    </div>
</div>
