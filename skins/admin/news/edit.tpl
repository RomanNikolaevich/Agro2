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
                    Категория новости:
                    <input type="text" class="form-control" name="cat" value="<?= htmlspecialchars($row['cat']);?>">
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

