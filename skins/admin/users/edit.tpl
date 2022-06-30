<h4>Редактирование личных данных:</h4>
<div>
<form method="post">
    <table class="table table-hover">
        <tbody>
        <tr>
            <th scope="row">id</th>
            <td colspan="4"><?=htmlspecialchars($row['id'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">login</th>
            <td colspan="4"><?=htmlspecialchars($row['login'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">password</th>
            <td colspan="4">
                <input type="password" name="password" value="">
            </td>
        </tr>
        <tr>
            <th scope="row">e-mail</th>
            <td colspan="4"><?=htmlspecialchars($row['email'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">age</th>
            <td colspan="4">
                <input type="number" name="age" value="<?=htmlspecialchars($row['age'] ?? '');?>">
            </td>
        </tr>
        <tr>
            <th scope="row">IP</th>
            <td colspan="4"><?=htmlspecialchars(long2ip($row['ip']) ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">active</th>
            <td colspan="4">
                <?=htmlspecialchars($row['active'] == 1 ? ' Активный' : 'Неактивный');?>
                <?php if($row['active'] == 1){?>
                <a class="" href="/admin/users/main?action=activeoff&id=<?php echo $row['id'];
                ?>"><img style="width:60px" src="/skins/admin/img/on.png"></a>
                <?php } else { ?>
                <a class="" href="/admin/users/main?action=activeon&id=<?php echo $row['id'];
                ?>"><img style="width:60px" src="/skins/admin/img/off.png"></a>
                <?php } ?>
            </td>
        </tr>
        <tr>
            <th scope="row">access</th>
            <td colspan="1"><?=htmlspecialchars($row['access'] ?? '');?></td>
            <td colspan="1"><a class="" href="/admin/users/main?action=blocked&id=<?php echo $row['id'];
                ?>"><img style="width:40px" src="/skins/admin/img/blocked-user.png"></a>
                <a class="" href="/admin/users/main?action=regular&id=<?php echo $row['id'];
                ?>"><img style="width:40px" src="/skins/admin/img/main-user-1.png"></a>
                <a class="" href="/admin/users/main?action=admin&id=<?php echo $row['id'];
                ?>"><img style="width:40px" src="/skins/admin/img/admin-user-3.png"></a>
                <?php if(isset($_SESSION['user'])
                        && $_SESSION['user']['access'] === SUPER_ADMIN) {?>

                    <a class="" href="/admin/users/main?action=superadmin&id=<?php echo $row['id'];
                    ?>"><img style="width:40px" src="/skins/admin/img/superadmin.png"></a>
                <?php } ?>
            </td>


        </tr>
        <tr>
            <th scope="row">Дата регистрации</th>
            <td colspan="4">
                <?=htmlspecialchars($dateReg['date_reg'] ?? '');?>
                <input type="datetime-local" name="date" value="">
            </td>
        </tr>
        <tr>
            <th scope="row">Дата последней активности</th>
            <td colspan="4"><?php timeActivity($row); ?></td>
        </tr>
        <tr>
            <th scope="row">О себе</th>
            <td colspan="4"><textarea class="form-control" name="aboutme"><?=
                    htmlspecialchars($row['about']); ?></textarea>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th scope="row"></th>
            <td>
                <input type="submit" name="ok" class="btn btn-primary" value="Сохранить изменения">
                <a class="btn btn-secondary" href="/admin/users/">Вернуться</a>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</div>

