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
<div class="container mt-4">
	<div class="row">
		<div class="form-group">
			<h2>ОТЗЫВЫ</h2>
			<h5>Если Вы остались довольны услугами <span>"AGRO.UNITED"</span> или вам что-то не понравилось,
				то можете оставить свой отзыв</h5>
            <?php if(isset($_SESSION['user'])) { ?>
            <!-- Start "Видимый блок отзывов для авторизированных пользователей" -->
            <?php if (!isset($_SESSION['commentOk'])) { ?>
				<form action="" method="post">
					<textarea class="form-control" name="comment"
							  placeholder="Оставьте свой отзыв *"></textarea><br>
                    <?php if (!empty($errors['comment'])): ?>
						<span style="color:red"><?=$errors['comment']?></span><br>
                    <?php endif ?>
					<p style="font-size:12px;">* - поле обязательное для заполнения</p>
					<button class="btn btn-suc" name="do_signup" type="submit">Отправить</button>
				</form>
                <?php } else {
                unset($_SESSION['commentOk']); ?>
				<div>Спасибо за Ваш отзыв!</div>
                <?php } ?>
			<br>
            <!-- End "Видимый блок отзывов для авторизированных пользователей" -->
            <?php } else { ?>
                <span>Отзывы могут оставлять только зарегистрированные
                    пользователи.</span><br>
                <span>Для регистрации перейдите по ссылке: </span><a style=" text-decoration: none; color: red;"
                      href="/auth/regin">Регистрация</a><br>
                <span>если вы уже зарегистрированы, то пройдите авторизацию:</span>
                <a style=" text-decoration: none; color: red;"
                   href="/auth/login">Авторизация</a><br>
            <?php } ?>
		</div>
	</div>
</div>
<!--Вывод отзывов из БД на экран:-->
<div class="container mt-4">
	<div class="row">
		<div class="col">
			<h4>Отзывы наших клиентов:</h4>
			<div class="comment-body">
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
                                <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
                                <span style="color: green">отзыв одобрен</span><br>
                                 <?php } ?>
                                <i><?= nl2br(htmlspecialchars($comment['text']));?></i><br>
                            <?php }
                            //End: Общий просмотр "Одобренные отзывы"
							//Start: Доступ админа "Скрытые отзывы"
                             else {
								  if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
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
                        <!--Start "Блок админов"-->
                        <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2){?>
                                <form method="post" action="/index.php?module=comments&action=main&id=<?php echo $comment['id'];?>">
                                    <input class="btn btn-secondary" name="hidecomment" type="submit" value="Скрыть">
                                    <input class="btn btn-success" name="showcomment" type="submit" value="Одобрить">
                                </form>
                        <?php }?>
                        <!--End "Блок админов"-->
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
