<h4>Редактирование личных данных:</h4>
<div>
    <table class="table table-hover">
        <tbody>
        <tr>
            <th scope="row">avatar</th>
            <td colspan="4"><img src="/uploaded/<?=htmlspecialchars($row['img'] ?? '');?>" alt=""
                style="height:100px"></td>

        </tr>
        <tr>
            <th scope="row">change avatar</th>
            <td>
                <form action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="MAX_FILE_SIZE" value="50000000"/>
                    <input type="file" class="btn btn-light" name="file">
                    <input type="submit" name="submit" class="btn btn-light" value="Загрузить файл">
                </form>
            </td>
        </tr>
        <form method="post">
            <tr>
                <th scope="row">login</th>
                <td colspan="4">
                    <input type="text" name="login" value="<?=htmlspecialchars($row['login'] ?? '');?>">
                </td>
            </tr>
            <tr>
                <th scope="row">password</th>
                <td colspan="4">
                    <input type="password" name="password" value="<?=htmlspecialchars($row['password'] ?? '');?>">
                </td>
            </tr>
            <tr>
                <th scope="row">age</th>
                <td colspan="4">
                    <input type="number" name="age" value="<?=htmlspecialchars($row['age'] ?? '');?>">
                </td>
            </tr>

            <tr>
                <th scope="row">О себе</th>
                <td colspan="4"><textarea class="form-control" name="aboutme"><?=
                        htmlspecialchars($row['about']);?></textarea>
                </td>
            </tr>
            <tr>
                <th scope="row"></th>
                <td>
                    <input type="submit" name="ok" class="btn btn-warning" value="Сохранить изменения">
                    <a class="btn btn-secondary" href="/users/main?id=<?= $_SESSION['user']['id'] ?? '' ?>">Вернуться к профилю</a>
                </td>
            </tr>
        </form>
        </tbody>
    </table>

</div>

