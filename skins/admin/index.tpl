<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><?php
        echo hsc(Core::$META['title'] = Core::$META['title'].' Панель администратора'); ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/skins/default/css/normalize.css" rel="stylesheet"/>
    <link href="/skins/admin/css/style.css" rel="stylesheet">
    <link rel="icon" href="/skins/default/img/favicon/favicon.ico" type="image/x-icon">
</head>
<body>
<div class="wrapper">
    <div class="container">
        <?php
        include './skins/'.Core::$SKIN.'/static/menu/header.tpl'; ?>
        <div class="conteiner-content">
            <?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) {
            echo $content;
             } elseif(!isset($_SESSION['user'])) { ?>
                ПРИВЕТ <br>
                <b style="color:red">НЕИЗВЕСТНЫЙ ПОЛЬЗОВАТЕЛЬ!</b><br>
                ЭТОТ РАЗДЕЛ МОГУТ ПРОСМОТРИВАТЬ ТОЛЬКО ПОЛЬЗОВАТЕЛИ С ПРАВАМИ АДМИНА
             <?php
                include './skins/default/auth/login.tpl';
            } else { ?>
                ПРИВЕТ <?php if (!empty($_SESSION['user'])) { ?><br>
                    <b style="color:red"> <?php echo $_SESSION['user']['login']; } ?></b><br>
                ЭТОТ РАЗДЕЛ МОГУТ ПРОСМОТРИВАТЬ ТОЛЬКО ПОЛЬЗОВАТЕЛИ С ПРАВАМИ АДМИНА
            <?php } ?>
        </div>
        <?php
        include './skins/'.Core::$SKIN.'/static/menu/footer.tpl'; ?>
    </div>
</div>
</body>
</html>
