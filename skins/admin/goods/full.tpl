<?php
if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
<div class="container mt-4" xmlns="http://www.w3.org/1999/html">
    <div class="row">
        <div class="form-group">
            <div>
                <p><b><?= htmlspecialchars($row['title'] ?? ''); ?></b></p>
            </div>
            <img class="rounded float-left" src="/skins/default/img/azot-1.jpg" style="width: 250px" alt="Card image cap">
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
<?php } else { ?>
    ПРИВЕТ СТАНИСЛАВ!
<?php } ?>
