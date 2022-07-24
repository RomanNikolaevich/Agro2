<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <div>
                <img class="rounded float-left" src="/uploaded/goods/<?=htmlspecialchars($row['img'] ?? '');?>"
                     alt="Card image cap" style="width:350px">
            </div>
            <div>
                <form action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="MAX_FILE_SIZE" value="50000000"/>
                    <input type="file" class="btn btn-light" name="file" accept="image/*">
                    <input type="submit" name="submit" class="btn btn-light" value="Загрузить файл">
                </form>
            </div>
            <form action="" method="post">
                <div style="padding-bottom:20px">
                    Заголовок новости *:
                    <input type="text" class="form-control" name="title" value="<?=
                    htmlspecialchars($row['title']); ?>">
                </div>
                <div style="padding-bottom:20px">
                    Категория новости (выберите из списка):
                    <?php
                    echo '<select class="form-control" name="cat" selected="selected">'; //форма для выбора
                    while ($db=$newsCatFromDB->fetch_assoc()) {
                        echo '<option value="'.hsc($db['name']).'">'.hsc($db['name']).'</option>'; //выбор из БД
                    }

                    while ($total=$newsCatShow->fetch_assoc()) {
                        echo '<option value="'.hsc($total['name']).'">'.hsc($total['name']).'</option>';
                    }
                    echo '</select>';
                    ?>
                </div>
                <div style="padding-bottom:20px">
                    Описание новости:
                    <textarea class="form-control" name="description"><?=
                        htmlspecialchars($row['description']); ?></textarea>
                </div>
                <div style="padding-bottom:20px">
                    Полный текст новости:
                    <textarea class="form-control" name="text"><?= htmlspecialchars($row['text']); ?></textarea>
                </div>
                <div style="padding-bottom:20px">
                    <input type="submit" name="ok" class="btn btn-success" value="Сохранить изменения">
                    <a class="btn btn-info" href="/admin/news/">К списку новостей</a>
                </div>
            </form>
        </div>
    </div>
</div>
