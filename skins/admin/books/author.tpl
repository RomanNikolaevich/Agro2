<?php

/**
 * @var $booksAuthorShow
 * @var $error string
 */

?>
<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <h3>Редактирование авторов книг: создание, изменение, удаление</h3>
            <form action="" method="post">
                <div style="padding-bottom:30px">
                    <h4>Просмотр доступных авторов (выберите из списка):</h4>
                        <?php
                        echo '<select class="form-control" name="showauthor" selected="selected">'; //форма для выбора
                        echo '<option value=""></option>';//пустая опция
                        while ($row=$booksAuthorShow->fetch_assoc()) {
                            echo '<option value="'.hsc($row['name']).'">'.hsc($row['name']).'</option>';
                        }
                        echo '</select>';
                        ?>
                </div>
                <div style="padding-bottom:10px">
                    <h4>Добавление нового автора</h4>
                    <p>Допустимо использовать только буквы и дефисы, каждое новое
                        слово должно начинаться с большой буквы!</p>

                    <input type="text" class="form-control" name="newauthor"
                           placeholder="Убедитесь, что такой автор отсутствует">
                </div>
                <div style="padding-bottom:30px">
                    <input type="submit" name="newauthorsubmit" value="Добавить автора" class="btn btn-success">
                </div>
                <div style="padding-bottom:10px">
                    <h4>Редактирование авторов:</h4>
                    <p> 1. Выберите автора для редактировани (выберите из списка доступных авторов)</p>
                    <p> 2. Допустимо использовать только буквы и дефисы, каждое новое слово должно начинаться с большой буквы!</p>
                    <p> 3. Введите нового автора:</p>

                    <input type="text" class="form-control" name="editauthor"
                           placeholder="Убедитесь, в правильности ФИО нового автора">
                </div>
                <div style="padding-bottom:30px">
                    <input type="submit" name="editauthorsubmit" value="Изменить автора" class="btn btn-warning">
                </div>
                <div style="padding-bottom:5px">
                    <h4>Удаление авторов:</h4>
                    <p> 1. Выберите автора для удаления (выберите из списка доступных авторов)</p>
                    <p> 2. Жмете кнопку "Удалить автора"<br>
                    P.S.: Это действие нельзя отменить, поэтому будьте внимательны!</p>

                </div>
                <div style="padding-bottom:30px">
                    <input class="btn btn-danger" type="submit" name="deletecatsubmit" value="Удалить автора">
                </div>
                <div style="padding-bottom:30px">
                    <a class="btn btn-info" href="/admin/books/">К списку книг</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var error = '<?php echo $error; ?>';
    alert(error);
</script>
