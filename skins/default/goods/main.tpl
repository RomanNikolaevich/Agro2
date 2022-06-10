<form action="" method="post">
    <div class="container">
        <div class="row">
            <?php if (isset($info)) { ?>
                <h1><?php echo $info; ?></h1> <!--уведомление, о добавлении новой записи-->
            <?php } ?>
            <h4 class="text-center"> Предлагаемая нами продукция: </h4>
                <?php while($row = mysqli_fetch_assoc($goods)) { ?>
                    <div class="product col-md-4 col-sm-4 col-xs-12">
                        <div class="card">
                            <img class="card-img-top" src="/skins/default/img/azot-1.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { //только для админов видно ?>
                                    <input type="checkbox" name="ids[]" value="<?php echo $row['id'];
                                    ?>">  <?php } echo $row['title']; ?>
                                </h5>
                                <p class="card-text"><?php echo $row['description']; ?></p>
                            </div>
                            <div class="card-footer">
                                <h5 class="text-center">Цена: <?php echo $row['price']; ?> грн.</h5>
                            </div>
                            <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { //только для админов видно ?>
                            <div class="card-footer">
                                <a class="btn btn-warning" href="/goods/edit&id=<?php echo $row['id'];
                                ?>">Изменить</a>
                                <a class="btn btn-danger" href="/goods&action=delete&id=<?php echo $row['id'];
                                ?> ">Удалить</a>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
        </div>
    </div>
</form>
<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { //только для админов видно ?>
    <div class="product col-md-4 col-sm-4 col-xs-12">
        <button type="button" class="btn btn-success" onclick="window.location.href =
            '/goods/add';">Добавить товар</button>
        <button type="button" class="btn btn-danger" name="delete">Удалить товары</button>
    </div>
<?php } ?>


