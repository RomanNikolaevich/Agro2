<div class="container mt-4" xmlns="http://www.w3.org/1999/html">
    <div class="row">
        <div class="form-group">
            <div>
                <p><b>Пользователь: </b><?= hsc($row['id'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Пользователь: </b><?= hsc($row['name'] ?? ''); ?></p>
            </div>
            <div>
                <p> <b>Дата: </b><br><?= hsc($row['date'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Текст отзыва: </b> <br><?= hsc($row['text'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Статус: </b> <br><?= hsc($row['active'] == 1 ? 'show' : 'hide'); ?></p>
            </div>
        </div>
    </div>
</div>


