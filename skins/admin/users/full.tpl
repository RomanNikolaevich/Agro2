<h4>Личные данные: </h4> <h4 style="color:red"><?= $error ?? '' ?></h4>
<div>

    <table class="table table-hover">
<!--            <thead>
        <tr>
            <th scope="col">Band</th>
            <th scope="col">Year formed</th>
            <th scope="col">No. of Albums</th>
            <th scope="col">Most famous song</th>
        </tr>
        </thead>-->
        <tbody>
        <tr>
            <th scope="row">avatar</th>
            <td colspan="4"><img src="/uploaded/mini/<?=htmlspecialchars($row['img'] ?? '');?>" alt=""
                                 style="height:100px"></td>
        </tr>
        <tr>
            <th scope="row">id</th>
            <td colspan="4"><?=htmlspecialchars($row['id'] ?? '');?></td>
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
            <th scope="row">IP</th>
            <td colspan="4"><?=htmlspecialchars(long2ip($row['ip']) ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">active</th>
            <td colspan="4">
                <?=htmlspecialchars($row['active'] == 1 ? 'Активный' : 'Неактивный');?>
            </td>
        </tr>
        <tr>
            <th scope="row">access</th>
            <td colspan="1"><?=htmlspecialchars($row['access'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">Дата регистрации</th>
            <td colspan="4"><?=htmlspecialchars($dateReg['date_reg'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">Дата последней активности</th>
            <td colspan="4"><?php timeActivity($row); ?></td>
        </tr>
        <tr>
            <th scope="row">О себе</th>
            <td colspan="4"><?=htmlspecialchars($row['about'] ?? '');?>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th scope="row"></th>
            <td>
                <a class="btn btn-primary" href="/admin/users/edit?id=<?= $row['id'];
                ?>">Редактировать</a>
                <a class="btn btn-secondary" href="/admin/users/">Вернуться</a>
            </td>
        </tr>
        </tfoot>
    </table>
</div>

