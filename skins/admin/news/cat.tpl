<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <h3>Редактирование категорий новостей: создание, изменение, удаление</h3>
            <form action="" method="post">
                <div style="padding-bottom:30px">
                    <h4>Просмотр доступных категорий (выберите из списка):</h4>
                        <?php
                        echo '<select class="form-control" name="showcat" selected="selected">'; //форма для выбора
                        echo '<option value=""></option>';//пустая опция
                        while ($row=$newsCatShow->fetch_assoc()) {
                            echo '<option value="'.hsc($row['name']).'">'.hsc($row['name']).'</option>';
                        }
                        echo '</select>';
                        ?>
                </div>
                <div style="padding-bottom:10px">
                    <h4>Добавление новой категории:</h4>
                    <input type="text" class="form-control" name="newcat"
                           placeholder="Убедитесь, что такая категория отсутствует">
                </div>
                <div style="padding-bottom:30px">
                    <input type="submit" name="newcatsubmit" value="Добавить категорию" class="btn btn-success">
                </div>
                <div style="padding-bottom:10px">
                    <h4>Редактирование категорий:</h4>
                    <p> 1. Выберите категорию для редактировани (выберите из списка доступных категорий)</p>
                    <p> 2. Введите новое название категории:</p>
                    <input type="text" class="form-control" name="editcat"
                           placeholder="Убедитесь, в правильности нового названия категории">
                </div>
                <div style="padding-bottom:30px">
                    <input type="submit" name="editcatsubmit" value="Изменить категорию" class="btn btn-warning">
                </div>
                <div style="padding-bottom:5px">
                    <h4>Удаление категорий:</h4>
                    <p> 1. Выберите категорию для удаления (выберите из списка доступных категорий)</p>
                    <p> 2. Жмете кнопку "Удалить категорию"<br>
                    P.S.: Это действие нельзя отменить, поэтому будьте внимательны!</p>

                </div>
                <div style="padding-bottom:30px">
                    <input class="btn btn-danger" type="submit" name="deletecatsubmit" value="Удалить категорию">
                </div>
                <div style="padding-bottom:30px">
                    <a class="btn btn-info" href="/admin/news/">К списку новостей</a>
                </div>
            </form>
        </div>
    </div>
</div>
