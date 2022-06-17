<div class="row align-items-center">
    <div class="col-md-4">
        <img src="/skins/admin/img/notebook-1.JPG" style="align-content:flex-start; height:100px">
    </div>
    <div class="col-md-4">
        <div class="container-logo">
            <h2>ПАНЕЛЬ АДМИНИСТРАТОРА</h2>
        </div>
    </div>
    <div class="col-md-4">
        <div class="d-flex flex-row-reverse">
            <?php
            if (!empty($_SESSION['user'])) { ?>
            <p>С возвращением, <br>
                <img src="/skins/admin/img/user-50.png" style="align-content:flex-start; height:30px">
                    <?php echo $_SESSION['user']['login']; ?>
                <a class="nav-link" style="color:red"  href="/auth/logout">Выход</a>
                <?php } ?>
            </p>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <?php if (isset($_SESSION['user']) && $_SESSION['user']['access'] == 2) { ?>
        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" style="color:white" href="/admin/static/main">Главная (админка)</a>
                </li>
                    <a class="nav-link" style="color:white"> | </a>
                <li class="nav-item">
                    <a class="nav-link" style="color:white" href="/admin/news">Новости</a>
                </li>
                <a class="nav-link" style="color:white"> | </a>
                <li class="nav-item">
                    <a class="nav-link" style="color:white" href="/admin/goods">Товары</a>
                </li>
                <a class="nav-link" style="color:white"> | </a>
                <li class="nav-item">
                    <a class="nav-link" style="color:white" href="/admin/comments">Отзывы</a>
                </li>
                <a class="nav-link" style="color:white"> | </a>
                <li class="nav-item">
                    <a class="nav-link" style="color:white" href="/admin/users">Пользователи</a>
                </li>
            </ul>
        </div>
        <?php } ?>
        <div class="admin-nav">
            <a class="nav-link" style="color:white" href="/">Вернуться на сайт</a>
        </div>
    </div>

</nav>



