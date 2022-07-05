<?php
/**
 * @var $userDb
 * @var $errors string
 */
 ?>
<h5>Управление пользователями:</h5>
<p>
    <b>access = Blocked</b> - заблокированный пользователь: доступ к отзывам и новостям заблокирован<br>
    <b>access = NewUser</b> - новый пользователь: доступ ограниченный доступ(при регистрации: по умолчанию)<br>
    <b>access = Regular</b> - обычный пользователь: доступ к большинству контента<br>
    <b>access = Admin</b> - админ: может удалять, создавать, редактировать контент<br>
    <b>access = SuperAdmin</b> - суперадмин: может тоже что и админ + может удалять пользователей<br>

</p>
<p>
    <b>active = 0</b> - inactive (зарегистрированный пользователь, НЕ подтверживший регистрацию по email)<br>
    <b>active = 1</b> - active (зарегистрированный пользователь, подтверживший регистрацию по email)<br>
</p>
<div class="clearfix2"></div>
    <p style="color:red"><?= $info ?? ''; ?></p>

<table class="mytable">
    <tr class="mytable-header">
        <th colspan="<?php if(isset($_SESSION['user'])
        && $_SESSION['user']['access'] === SUPER_ADMIN) {?> 15
            <?php } else {?>10<?php }?>" style="text-align: center;">Поиск пользователей</th>
    </tr>
    <form method="post" action="">
        <td colspan="<?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?> 12
            <?php } else {?>7<?php }?>" class="">
            <input class="form-control mr-sm-2" type="search" name="search" style="color:blue"
                   placeholder="<?= $errors ?? 'Поиск логина' ?>" aria-label="Search"
            value="<?php if(isset ($_POST['search'])) { echo htmlspecialchars($_POST['search']);} ?>">
        </td>
        <td colspan="2" class="">
                    <button class="btn btn-primary" name="submit" type="submit"
                            style="align-items:center">Search</button>
        </td>
        <td colspan="1" class="">
            <button class="btn btn-secondary" name="reset" type="submit">Reset</button>
        </td>
    </form>

    <tr class="mytable-header">
        <th rowspan="2">
            <!-- th тег применяется для шапки таблицы-->
        </th>
        <th colspan="7" style="text-align: center;">Данные пользователей</th><!--растягивает ячейку на ширину трех нижних-->
        <?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
        <th colspan="4" style="text-align: center;">Редактирование доступа</th>
        <?php } ?>

        <?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
            <th colspan="3" style="text-align: center;">Профиль пользователя</th>
        <?php } else {?>
            <th colspan="2" style="text-align: center;">Профиль пользователя</th>
        <?php } ?>
    </tr>
    <tr class="mytable-header">
        <th style="text-align: center;">id</th>
        <th style="text-align: center;">login</th>
        <th style="text-align: center;">e-mail</th>
        <th style="text-align: center;">age</th>
        <th style="text-align: center;">IP</th>
        <th style="text-align: center;">active</th>
        <th style="text-align: center;">access</th>
        <?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
        <th style="text-align: center;">Blocked</th>
        <th style="text-align: center;">Regular</th>
        <th style="text-align: center;">Admin</th>

        <th>SuperAdmin</th>
        <?php } ?>
        <th style="text-align: center;">View</th>
        <th style="text-align: center;">Edit</th>
        <?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
            <th>Delete</th>
        <?php } ?>
    </tr>
    <?php while(isset($userDb) ? $row = mysqli_fetch_assoc($userDb) : '') { ?>
    <tr>
        <td class="">
            <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['id']; ?>
        </td>
        <td class="">
            <a class="" style="text-decoration: none;" href="/admin/users/full?id=<?php echo $row['id'];
            ?>"><?php echo hsc($row['login']); ?></a>
        </td>
        <td class="">
            <?php echo hsc($row['email']); ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo (int)$row['age']; ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo long2ip($row['ip']); ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['active']; ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo hsc($row['access']); ?>
        </td>
        <?php
        if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/main?action=blocked&id=<?php echo (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/blocked-user.png"></a>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/main?action=regular&id=<?php echo (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/main-user-1.png"></a>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/main?action=admin&id=<?php echo (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/admin-user-3.png"></a>
        </td>

        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/main?action=superadmin&id=<?php echo (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/superadmin.png"></a>
        </td>
        <?php } ?>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/full?id=<?= (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/view.png"></a>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/edit?id=<?= (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/rewrite-button-2.png"></a>
        </td>
        <?php if(isset($_SESSION['user'])
                && $_SESSION['user']['access'] === SUPER_ADMIN) {?>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users/main?action=delete&id=<?= (int)$row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/delete-button.png"></a>
        </td>
    <?php } ?>
    </tr>
    <?php } ?>
    </table>

