<?php
/**
 * @var $errors               array
 * @var $pageno               integer
 * @var $totalPages           integer
 * @var $comments             array
 * @var $commentCount         integer
 * @var $username             string
 * @var $offset               integer
 * @var $currentCommentNumber integer
 * @var $commentCountAll
 * @var $comments
 */
?>

<?php
if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
    <!--Вывод уведомления об изменениях-->
    <?php
    if (isset($info)) { ?>
        <h2><?php
            echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
        <?php
    } ?><br>
    <!--Вывод отзывов из БД на экран:-->
    <h4>Отзывы наших клиентов:</h4>
    <div class="comment-body">
        <p>
            <?=$commentCount
                    ? 'Всего отзывов:'.$commentCountAll.'<br>'
                    : 'Отзывов пока еще нет, вы будете первым';?>
            <?=$commentCount
                    ? 'из них одобрено: '.$commentCount.'<br>'
                    : 'Отзывов пока еще нет, вы будете первым';?>
        </p>
        <form action="" method="post">
            <table class="mytable">
                <tr class="mytable-header">
                    <th rowspan="2">
                        <!-- th тег применяется для шапки таблицы-->
                    </th>
                    <th colspan="5" style="text-align: center;">Содержимое отзывов</th>
                    <!--растягивает ячейку на ширину трех нижних-->
                    <th colspan="2" style="text-align: center;">Редактирование отзывов</th>
                </tr>
                <tr class="mytable-header" style="text-align: center;">
                    <th>id</th>
                    <th>дата</th>
                    <th>пользователь</th>
                    <th>отзыв</th>
                    <th>статус</th>
                    <th>show</th>
                    <th>hide</th>
                </tr>
                <?php
                while ($row = mysqli_fetch_assoc($comments)) { ?>
                    <tr style="font-size:15px; text-align: justify;">
                        <td class="">
                            <input type="checkbox" name="ids[]" value="<?= hsc($row['id']); ?>">
                        </td>
                        <td class="">
                            <?= hsc($row['id']); ?>
                        </td>
                        <td class="">
                            <?= hsc($row['date']); ?>
                        </td>
                        <td class="">
                            <?= hsc($row['name']); ?>
                        </td>
                        <td class="">
                            <?= mb_strimwidth($row['text'], 0, 150, "..."); ?>
                            <a class="" href="/admin/comments/full?id=<?= $row['id'];
                            ?>">(полная версия)</a>
                        </td>
                        <td class="" style="text-align: center; <?php echo $row['active'] == 1 ? 'color:green;'
                                : 'color: red;' ?>">
                            <?= $row['active'] == 1 ? 'show' : 'hide'; ?>
                        </td>
                        <td class="" style="text-align: center;">
                            <a class="" href="/admin/comments/main?action=show&id=<?php echo $row['id'];
                            ?>"><img style="width:40px" src="/skins/admin/img/show-button.png"></a>
                        </td>
                        <td class="" style="text-align: center;">
                            <a class="" href="/admin/comments/main?action=hide&id=<?php echo $row['id'];
                            ?>"><img style="width:40px" src="/skins/admin/img/hide-button.png"></a>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </form>
    </div>
    <div class="more-free-space">

    </div>
<?php } ?>
