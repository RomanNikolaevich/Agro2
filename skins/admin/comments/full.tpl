<?php
if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
<div class="container mt-4" xmlns="http://www.w3.org/1999/html">
    <div class="row">
        <div class="form-group">
            <div>
                <p><b>Пользователь: </b><?= htmlspecialchars($row['id'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Пользователь: </b><?= htmlspecialchars($row['name'] ?? ''); ?></p>
            </div>
            <div>
                <p> <b>Дата: </b><br><?= htmlspecialchars($row['date'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Текст отзыва: </b> <br><?= htmlspecialchars($row['text'] ?? ''); ?></p>
            </div>
            <div>
                <p><b>Статус: </b> <br><?= htmlspecialchars($row['active'] == 1 ? 'show' : 'hide'); ?></p>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<?php wtf($row);
