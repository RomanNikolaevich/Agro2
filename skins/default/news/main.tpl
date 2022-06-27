<?php
/**
 * @var $news array
 */
?>

<div class="container mt-4">
        <h3> Все существующие новости: </h3>
        <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']!=BLOCKED) { ?>
        <!-- Start "Видимый блок новостей для незабаненых пользователей" -->
        <form action="" method="post">
        <?php while($row = mysqli_fetch_assoc($news)) { ?>
        <div class="card mb-3">
            <img class="rounded float-md-left" style="width:350px" src="/skins/default/img/azot4.jpg" alt="Card image cap">
            <div class="card-body">
                <b><?= hsc($row['title']); ?></b> <!--вывод заглавия-->
                <span style="color:#5c636a; font-size:10px;"><?= hsc($row['date']) ?></span><!-- и даты, серым-->
            </div>
            <div class="card-footer">
                <p><?= hsc($row['description']); ?></p>
                <?= hsc(mb_strimwidth($row['text'], 0, 450, "...")); ?> <a class=""
                    href="/news/full?id=<?= (int)$row['id']; ?>">(полная версия)</a>
            </div>
        </div>
            <hr>
        </form>
        <!-- End "Видимый блок новостей для незабаненых пользователей" -->
        <?php } }?>
</div>
