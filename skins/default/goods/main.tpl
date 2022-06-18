<form action="" method="post">
    <div class="container">
        <div class="row">
            <h4 class="text-center"> Предлагаемая нами продукция: </h4>
                <?php while($row = mysqli_fetch_assoc($goods)) { ?>
                    <div class="product col-md-4 col-sm-4 col-xs-12">
                        <div class="card">
                                <img class="card-img-top" src="/skins/default/img/azot-1.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">
                                     <a class="link-dark" style="text-decoration: none;"
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
                        </div>
                    </div>
                <?php } ?>
        </div>
    </div>
</form>



