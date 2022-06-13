<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
    <?php
    /**
     * @var $errors array
     * @var $pageno integer
     * @var $totalPages integer
     * @var $comments array
     * @var $commentCount integer
     * @var $username string
     * @var $offset integer
     * @var $currentCommentNumber integer
     */
    ?>
<!--Вывод уведомления об изменениях-->
    <?php
    if (isset($info)) { ?>
        <h2><?php
            echo $info; ?></h2> <!--уведомление, о добавлении новой записи-->
        <?php
    } ?><br>
    <!--Вывод отзывов из БД на экран:-->
    <div class="container mt-4">
        <div class="row">
            <div class="col">
                <h4>Отзывы наших клиентов:</h4>
                <div class="comment-body">
                    <p>
                        <?=$commentCount
                                ? 'Всего отзывов:' .$commentCountAll.'<br>'
                                : 'Отзывов пока еще нет, вы будете первым';?>
                        <?=$commentCount
                                ? 'из них одобрено: '.$commentCount.'<br>'
                                : 'Отзывов пока еще нет, вы будете первым';?>
                    </p>

                        <table class="mytable">
                            <tr class="mytable-header">
                                <th rowspan="2">
                                    <!-- th тег применяется для шапки таблицы-->
                                </th>
                                <th colspan="5" style="text-align: center;">Содержимое новостей</th><!--растягивает ячейку на ширину трех нижних-->
                                <th colspan="2" style="text-align: center;">Редактирование новостей</th>
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
                            <?php while($row = mysqli_fetch_assoc($comments)) { ?>
                                <tr style="font-family:Tahoma, sans-serif, font-size:13px; text-align: justify;">
                                    <td class="">
                                        <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
                                    </td>
                                    <td class="">
                                        <?php echo $row['id']; ?>
                                    </td>
                                    <td class="">
                                        <?php echo $row['date']; ?>
                                    </td>
                                    <td class="">
                                        <?php echo $row['name']; ?>
                                    </td>
                                    <td class="">
                                        <?php echo mb_strimwidth($row['text'], 0, 150, "..."); ?>
                                        <a class="" href="/admin/comments/full&id=<?php echo $row['id'];
                                        ?>">(полная версия)</a>
                                    </td>
                                    <td class="" style="text-align: center;">
                                        <?php echo $row['active'] == 1 ? 'show' : 'hide'; ?>
                                    </td>
                                    <td class="" style="text-align: center;">
                                        <form method="post" action="/admin/comments&action=main&id=<?php echo $comment['id'];?>">
                                            <input type="image" name="showcomment" width="40px"
                                                   src="/skins/admin/img/show-button.png">
                                        </form>
                                    </td>
                                    <td class="" style="text-align: center;">
                                        <form method="post" action="/admin/comments&action=main&id=<?php echo $comment['id'];?>">
                                            <input type="image" name="hidecomment" width="40px"
                                                   src="/skins/admin/img/hide-button.png">
                                        </form>
                                    </td>
                                </tr>
                            <?php } ?>
                        </table>

                </div>
                <div class="more-free-space">

                </div>
            </div>
        </div>
    </div>

<?php } ?>
