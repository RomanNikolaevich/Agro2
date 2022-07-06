<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <div>
                <p><b><?= htmlspecialchars($row['title'] ?? ''); ?></b></p>
            </div>
            <img class="rounded float-left" src="/uploaded/goods/<?=htmlspecialchars($row['img'] ?? '');?>"
                 alt="Card image cap" style="width:350px">
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
        </div>
    </div>
</div>

