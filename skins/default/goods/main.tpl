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
                                    <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
                                    <input type="checkbox" name="ids[]" value="<?php echo $row['id'];
                                    ?>">  <?php } ?> <a class="link-dark" style="text-decoration: none;"
                                        href="/goods/full?id=<?php
                                    echo $row['id']; ?>"><?php echo hsc($row['title']); ?></a>
                                </h5>
                                <p class="card-text"><?php echo hsc(mb_strimwidth($row['description'], 0, 150,
                                            "...")); ?> <a class="link-dark" href="/goods/full?id=<?php
                                    echo $row['id']; ?>">(полное описание)</a></p>
                            </div>
                            <div class="card-footer">
                                <h5 class="text-center">Цена: <?php echo hsc($row['price']); ?> грн.</h5>
                            </div>
                            <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
                            <div class="card-footer">
                                <a class="btn btn-warning" href="/goods/edit?id=<?php echo $row['id'];
                                ?>">Изменить</a>
                                <a class="btn btn-danger" href="/goods/main?action=delete&id=<?php echo $row['id'];
                                ?> ">Удалить</a>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
        </div>
    </div>
    <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { //только для админов видно ?>
        <div class="product col-md-4 col-sm-4 col-xs-12">
            <a class="btn btn-success" href="/goods/add">Добавить товар</a>
            <input class="btn btn-danger" type="submit" name="delete" value="Удалить товары">
        </div>
    <?php } ?>
</form>



