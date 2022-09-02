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
//include './skins/'.Core::$SKIN.'/comments/add.tpl';
?>
<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <h2>ОТЗЫВЫ</h2>
            <h5>Если Вы остались довольны услугами <span>"AGRO.UNITED"</span> или вам что-то не понравилось,
                то можете оставить свой отзыв</h5>
            <?php if(isset($_SESSION['user'])) { ?>
                <!-- Start "Видимый блок отзывов для авторизированных пользователей" -->
                    <?php if (!empty($errors['comment'])): ?>
                        <span style="color:red" id="commentError"><?=$errors['comment']?></span><br>
                    <?php endif ?>
                <form action="" method="post" onsubmit="myAjaxComments(); return false">
                        <input type="hidden" name="login" id="login" placeholder="" value="<?= $_SESSION['user']['login'] ?>">
                        <textarea class="form-control" name="comment" id="comment"
                                  placeholder="Оставьте свой отзыв *"></textarea><br>
                        <p style="font-size:12px;">* - поле обязательное для заполнения</p>
                        <button class="btn btn-suc" name="do_signup" id="do_signup" type="submit">Отправить</button>
                    </form>
                <!-- End "Видимый блок отзывов для авторизированных пользователей" -->
            <?php } else { ?>
                <span>Отзывы могут оставлять только зарегистрированные
                    пользователи.</span><br>
            <?php } ?>
        </div>
    </div>
</div>
<!--Конец формы ввода отзывов:-->




<!--Вывод отзывов из БД на экран:-->
<div class="container mt-4" id="allComments">
	<div class="row">
		<div class="col">
            <div id="addedComment" hidden>
                <h4>Ваш комментарий был добавлен:</h4>
                <div id="addedCommentLogin" class="nameComment"></div>
                <div id="addedCommentText" class="textComment"></div>
            </div>
			<h4>Отзывы наших клиентов:</h4>
			<div class="comment-body" id="allComments">
				<p>
                    <?=$commentCount
                        ? 'Всего '.$commentCount.' отзывов:<br>'
                        : 'Отзывов пока еще нет, вы будете первым';?>
				</p>

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

<script>
/*    window.onload = function (e) {
        document.getElementById('feedBack').onsubmit = myAjaxComments;
    }

    const form = document.querySelector('#feedBack');
    const comment = document.querySelector('#comment');
    form.addEventListener('submit', function(evt) {
        evt.preventDefault();
        if(!comment.value) {
            alert('Поле комментарий не заполнено');
            return;
        }

        this.submit();
    });*/
</script>
