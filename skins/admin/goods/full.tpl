<div class="container mt-4" xmlns="http://www.w3.org/1999/html">
    <div class="row">
        <div class="form-group">
            <div>
                <p><b><?= htmlspecialchars($row['title'] ?? ''); ?></b></p>
            </div>
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
            <div>
                <p> <b>Категория товара:</b><br><?= htmlspecialchars($row['cat'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Краткое описание товара:</b> <br><?= htmlspecialchars($row['description'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Полное  товара:</b> <br><?= htmlspecialchars($row['text'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Цена:</b> <?= htmlspecialchars($row['price'] ?? ''); ?> грн.</p>
            </div>
            <div>
                <a class="btn btn-primary" href="/admin/goods/edit?id=<?= $row['id'];
                ?>">Редактировать</a>
                <a class="btn btn-secondary" href="/admin/goods/">К списку товаров</a>
            </div>
            <p></p>
        </div>
    </div>
</div>

