<?php
/**
 * @var $pagePath
 * @var $content
 * @var $error
 */
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<?php echo hsc(Core::$META['description']); ?>">
    <meta name="keywords" content="<?php echo hsc(Core::$META['keywords']);?>">
    <title><?php echo hsc(Core::$META['title']); ?></title>
    <link href="/skins/default/css/bootstrap.min.css" rel="stylesheet">
    <link href="/skins/default/css/normalize.css" rel="stylesheet"/>
    <link href="/skins/default/css/style.css" rel="stylesheet">
    <link rel="icon" href="/skins/default/img/favicon/favicon.ico" type="image/x-icon">
    <script src="/skins/default/js/jquery-3.6.1.min.js"></script>
    <script src="/skins/default/js/script.js"></script>
</head>
<body>
<div class="block">
	<?php include './skins/'.Core::$SKIN.'/static/menu/header.tpl';
    echo $content;
    if (!isset($_SESSION['user'])) {
        include './skins/'.Core::$SKIN.'/auth/login.tpl';
        include './skins/'.Core::$SKIN.'/auth/regin.tpl';
    }
    ?>

    <div class="conteiner-content">
		<?php include './skins/'.Core::$SKIN.'/static/menu/footer.tpl'; ?>
    </div>
</div>
<script>
    let error = '<?php echo $error ?? ''; ?>';
    let notice = '<?php echo $notice ?? ''; ?>';
    if (error) {
        alert(error);
    } else if (notice) {
        alert(notice);
        location.reload();
    }
</script>
</body>
</html>
