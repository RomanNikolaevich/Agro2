<?php
/**
 * @var $userDb
 */

if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
<h5>Управление пользователями:</h5>
<p>
    <b>access = 0</b> - new user (новый пользователь: доступ ограниченный доступ)<br>
    <b>access = 1</b> - regular (обычный пользователь: доступ к большинству контента)<br>
    <b>access = 2</b> - admin (админ: может удалять, создавать, редактировать контент)<br>
    <b>access = 5</b> - blocked (заблокированный пользователь: доступ к отзывам и новостям заблокирован)<br>
</p>
<p>
    <b>active = 1</b> - active (зарегистрированный пользователь, подтверживший регистрацию по email)<br>
    <b>active = 0</b> - inactive (зарегистрированный пользователь, НЕ подтверживший регистрацию по email)<br>
</p>
<div class="clearfix2"></div>
    <p style="color:red"><?= $info ?? ''; ?></p>
<form action="" method="post">
<table class="mytable">
    <tr class="mytable-header">
        <th rowspan="2">
            <!-- th тег применяется для шапки таблицы-->
        </th>
        <th colspan="6">Данные пользователей</th><!--растягивает ячейку на ширину трех нижних-->
        <th colspan="3">Редактирование доступа</th>
    </tr>
    <tr class="mytable-header">
        <th>id</th>
        <th>login</th>
        <th>email</th>
        <th>age</th>
        <th>active</th>
        <th>access</th>
        <th>regular</th>
        <th>admin</th>
        <th>blocked</th>
    </tr>
    <?php while($row = mysqli_fetch_assoc($userDb)) { ?>
    <tr>
        <td class="">
            <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['id']; ?>
        </td>
        <td class="">
            <?php echo $row['login']; ?>
        </td>
        <td class="">
            <?php echo $row['email']; ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['age']; ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['active']; ?>
        </td>
        <td class="" style="text-align: center;">
            <?php echo $row['access']; ?>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users&action=regular&id=<?php echo $row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/main-user-1.png"></a>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users&action=admin&id=<?php echo $row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/admin-user-3.png"></a>
        </td>
        <td class="" style="text-align: center;">
            <a class="" href="/admin/users&action=blocked&id=<?php echo $row['id'];
            ?>"><img style="width:40px" src="/skins/admin/img/blocked-user.png"></a>
        </td>
    </tr>
    <?php } ?>
    </table>
</form>
<?php } ?>

