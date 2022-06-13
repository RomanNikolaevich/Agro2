<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
    <div class="container mt-4">
        <div class="row">
            <div class="form-group">
                    <div>
                        <p>Заголовок новости: <?= htmlspecialchars($row['title'] ?? ''); ?></p>
                    </div>
                <img class="rounded float-left" src="/skins/default/img/azot4.jpg" style="width: 350px" alt="Card image cap">
                    <div>
                        <p>Категория новости: <?= htmlspecialchars($row['cat'] ?? ''); ?></p>
                    </div>
                    <div>
                        <p>Описание новости: <?= htmlspecialchars($row['description'] ?? ''); ?></p>
                    </div>
                    <div>
                        <p>Полный текст новости: <?= htmlspecialchars($row['text'] ?? ''); ?></p>
                    </div>
            </div>
        </div>
    </div>
<?php } ?>
