<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <form action="" method="post">
                <div>
                    Заголовок новости *:
                    <input type="text" class="form-control" name="title" value="<?=
                     htmlspecialchars($_POST['title'] ?? ''); ?>">
                </div>
                <div>
                    Категория новости:
                    <input type="text" class="form-control" name="cat" value="<?=
                     htmlspecialchars($_POST['cat'] ?? ''); ?>">
                </div>
                <div>
                    Описание новости:
                    <textarea class="form-control" name="description"><?=
                         htmlspecialchars($_POST['description'] ?? ''); ?></textarea>
                </div>
                <div>
                    Полный текст новости:
                    <textarea class="form-control" name="text"><?=
                         htmlspecialchars($_POST['text'] ?? '');?></textarea>
                </div>
                <input type="submit" name="add" value="Добавить новость">
            </form>
        </div>
    </div>
</div>

