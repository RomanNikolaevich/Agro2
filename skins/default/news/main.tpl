<?php
/**
 * @var $news array
 */
?>

<div class="container mt-4">
    <?php if (isset($info)) { ?>
        <h1><?php echo $info; ?></h1> <!--уведомление, о добавлении новой записи-->
    <?php } ?><br>
        <h3> Все существующие новости: </h3>
        <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']!=5) { ?>
        <!-- Start "Видимый блок новостей для незабаненых пользователей" -->
        <form action="" method="post">
        <?php while($row = mysqli_fetch_assoc($news)) { ?>
        <div class="card mb-3">
            <img class="rounded float-md-left" style="width:350px" src="/skins/default/img/azot4.jpg" alt="Card image cap">
            <div class="card-body">
                <!--Start: Доступ только админам: кнопки для каждой отдельной новости-->
                <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
                <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
                <a class="btn btn-warning" href="/index.php?module=news&page=edit&id=<?php echo $row['id'];
                ?>">Изменить</a>
                <a class="btn btn-danger" href="/index.php?module=news&action=delete&id=<?php echo $row['id'];
                ?> ">Удалить</a>
                <?php } ?>
                <!--End: Доступ только админам: кнопки для каждой отдельной новости-->
                <b><?php echo $row['title']; ?></b> <!--вывод заглавия-->
                <span style="color:#5c636a; font-size:10px;"><?= $row['date'] ?></span><!-- и даты, серым-->

            </div>
            <div class="card-footer">
                <p><?php echo $row['description']; ?></p>
                <?php echo mb_strimwidth($row['text'], 0, 450, "..."); ?> <a class="" href="/index.php?module=news&page=full&id=<?php echo $row['id'];
                ?>">(полная версия)</a>
            </div>
        </div>
            <hr>
            <!--Start: Доступ только админам: кнопки для всех новостей-->
        <?php }
            if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { //только для админов видно ?>
            <a class="btn btn-primary" href="/news/add">Добавить новость</a>
            <input class="btn btn-danger" type="submit" name="delete" value="Удалить отмеченные записи">
            <?php } ?>
            <!--End: Доступ только админам: кнопки для всех новостей-->
        </form>
        <!-- End "Видимый блок новостей для незабаненых пользователей" -->
        <?php } else { ?>
            <span>К сожалению Ваш аккаунт был заблокирован или вы не авторизировались, поэтому вы не
                сможете просматривать данные новости.</span><br>
            <span>Для регистрации перейдите по ссылке: </span><a style=" text-decoration: none; color: red;"
                href="/auth/regin">Регистрация</a><br>
            <span>если вы уже зарегистрированы, то пройдите авторизацию:</span>
            <a style=" text-decoration: none; color: red;"
               href="/auth/login">Авторизация</a><br>
        <?php } ?>
</div>
