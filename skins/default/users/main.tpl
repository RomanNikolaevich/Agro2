<h4>Персональный кабинет: </h4> <h4 style="color:red"><?= $error ?? '' ?></h4>
<div>
    <table class="table table-hover">
        <tbody>
        <tr>
            <th scope="row">avatar</th>
            <td colspan="4"><img src="/uploaded/<?=htmlspecialchars($row['img'] ?? '');?>" alt=""
                                 style="height:100px"></td>
        </tr>
        <tr>
            <th scope="row">login</th>
            <td colspan="4"><?=htmlspecialchars($row['login'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">e-mail</th>
            <td colspan="4"><?=htmlspecialchars($row['email'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">age</th>
            <td colspan="4"><?=htmlspecialchars($row['age'] ?? '');?></td>
        </tr>
        <tr>
        <tr>
            <th scope="row">Дата регистрации</th>
            <td colspan="4"><?=htmlspecialchars($dateReg['date_reg'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">О себе</th>
            <td colspan="4"><?=htmlspecialchars($row['about'] ?? '');?>
            </td>
        </tr>
        <tr>
            <th scope="row"></th>
            <td>
                <a class="btn btn-warning" href="/users/edit?id=<?= $row['id'];
                ?>">Редактировать</a>
                <a class="btn btn-secondary" href="/">На главную</a>
            </td>
        </tr>
        </tbody>
        <tfoot>

        </tfoot>
    </table>
</div>

