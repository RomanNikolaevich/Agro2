<h4>Личные данные:</h4>
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
            <td colspan="4"><?=htmlspecialchars($row['active'] ?? '');?></td>
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
            <td colspan="4"><?=htmlspecialchars($row['date_reg'] ?? '');?></td>
        </tr>
        <tr>
            <th scope="row">Дата последней активности</th>
            <td colspan="4"><?php timeActivity($row); ?></td>
        </tr>
        <tr>
            <th scope="row">О себе</th>
            <td colspan="4">I hear that Nancy is very pretty.
                Ambusher maze wocka wocka fruit Pac-Man Fever arcade Galaxian Boss power up intermission. Pac-Man
                Namco Toru Iwatani Pac-Man Fever maze dots. Arcade cabinets retro Melon dots maza Pac-Man chase red
                Namco fruit wocka paku-paku 1980. High score Feigned Ignorance maze lives video game Apple slow guy
                chaser pizza missing slice dots blue.

                Flying fish few by the space station. Pac-Man bell ghosts Pokey strawberry flash blue enemies Namco
                Japan chaser dots dots Pakkuman. She learned that water bottles are no longer just to hold liquid,
                but they're also status symbols. Patricia loves the sound of nails strongly pressed against the
                chalkboard. He had a hidden stash underneath the floorboards in the back room of the house.
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th scope="row"></th>
            <td><a class="btn btn-primary" href="/admin/users/edit?id=<?= $row['id'];
                ?>">Редактировать</a></td>
        </tr>
        </tfoot>
    </table>
</div>

