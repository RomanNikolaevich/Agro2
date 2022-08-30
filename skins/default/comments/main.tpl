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
<!--Форма ввода отзывов:-->
<?php
include './skins/'.Core::$SKIN.'/comments/add.tpl';
?>
<!--Конец формф ввода отзывов:-->
<!--Вывод отзывов из БД на экран:-->
<div class="container mt-4">
	<div class="row">
		<div class="col">
			<h4>Отзывы наших клиентов:</h4>
			<div class="comment-body" id="allComments">
				<p>
                    <?=$commentCount
                        ? 'Всего '.$commentCount.' отзывов:<br>'
                        : 'Отзывов пока еще нет, вы будете первым';?>
				</p>
                <div id="addedComment" style="display: none">
                    <div class="comment">
                        <div id="addedCommentLoginAndDate" class="nameComment"></div>
                        <div id="addedCommentText" class="textComment"></div>
                    </div>
                </div>
				<div>
                    <?php foreach ($comments as $comment):?>
                        <!--Start "Блок вывода отзывов из БД:"-->
						<div>
                            <!--Start: Общий просмотр "Одобренные отзывы"-->
                            <?php if($comment['active'] == 1) { ?>
                                # <?php //порядковый номер отзыва
                                if ($currentCommentNumber > 0) {
                                    echo $currentCommentNumber--;
                                } ?> |
                                user: <u><?= htmlspecialchars($comment['name'])?></u> |
                                date: <u><?= $comment['date']?></u> | :
                                <?php if(isset($_SESSION['user'])
                                        && ($_SESSION['user']['access'] === ADMIN
                                        || $_SESSION['user']['access'] === SUPER_ADMIN)) {?>
                                <span style="color: green">отзыв одобрен</span><br>
                                 <?php } ?>
                                <i><?= nl2br(htmlspecialchars($comment['text']));?></i><br>
                            <?php }
                            //End: Общий просмотр "Одобренные отзывы"
							//Start: Доступ админа "Скрытые отзывы"
                             else {
                                 if(isset($_SESSION['user'])
                                         && ($_SESSION['user']['access'] === ADMIN
                                         || $_SESSION['user']['access'] === SUPER_ADMIN)) {?>
                                # <?php //порядковый номер отзыва
                                if ($currentCommentNumber > 0) {
                                    echo $currentCommentNumber--;
                                } ?> |
                                user: <u><?= htmlspecialchars($comment['name'])?></u> |
                                date: <u><?= $comment['date']?></u> | :
                                <span style="color: red">отзыв скрыт</span><br>
                                <i><?= nl2br(htmlspecialchars($comment['text']));?></i><br>
                             <?php } ?>
                        <?php } ?> <br>
                            <!--End: "Блок админа: вывод уведомления о статусе отзыва"-->
						</div>
                        <!--End "Блок вывода отзывов из БД"-->

						<p></p>
                    <?php endforeach; ?>
				</div>
			</div>
			<br>
		</div>
	</div>
</div>

<!--Пагинатор:-->
<div class="container mt-4">
	<div class="row">
		<div class="col">
			<ul class="pagination">
				<li class="page-item">
					<a class="page-link" href="?module=comments&pageno=1">First</a>
				</li>
                <?php if ($pageno > 1): ?>
					<li class="page-item">
						<a class="page-link" href="?module=comments&pageno=
							<?= ($pageno - 1); ?>">Prev</a>
					</li>
                <?php endif;
                if ($pageno > 1): ?>
					<li class="page-item">
						<a class="page-link" href="?module=comments&pageno=<?= ($pageno - 1); ?>">
                            <?= ($pageno - 1); ?></a>
					</li>
                <?php endif; ?>
				<li class="page-item">
					<a class="page-link" href="?module=comments&pageno=<?= $pageno; ?>">
                        <?= $pageno; ?></a>
				</li>
                <?php
                if ($pageno < $totalPages): ?>
					<li class="page-item">
						<a class="page-link" href="?module=comments&pageno=<?= ($pageno + 1); ?>">
                            <?= ($pageno + 1); ?></a>
					</li>
                <?php endif;
                if ($pageno < $totalPages): ?>
					<li class="page-item">
						<a class="page-link" href="?module=comments&pageno=<?= ($pageno + 1); ?>">Next</a>
					</li>
                <?php endif; ?>
				<li class="page-item">
					<a class="page-link" href='?module=comments&pageno=<?= $totalPages?>'>Last</a>
				</li>
			</ul>
		</div>
	</div>
</div>
