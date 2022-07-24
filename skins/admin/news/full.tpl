<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <div>
                <p>Заголовок новости: <?=htmlspecialchars($row['title'] ?? '');?></p>
            </div>
            <div>
                <img class="rounded float-left" src="/uploaded/goods/<?=htmlspecialchars($row['img'] ?? '');?>"
                     alt="Card image cap" style="width:350px">
            </div>
            <div>
                <p>Категория новости: <?=htmlspecialchars($row['cat'] ?? '');?></p>
            </div>
            <div>
                <p>Описание новости: <?=htmlspecialchars($row['description'] ?? '');?></p>
            </div>
            <div>
                <p>Полный текст новости: <?=htmlspecialchars($row['text'] ?? '');?></p>
            </div>
            <div style="padding-bottom:30px">
                <a class="btn btn-info" href="/admin/news/">К списку новостей</a>
            </div>
        </div>
    </div>
</div>
