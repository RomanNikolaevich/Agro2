<?php
/**
 * @var $pagePath
 * @var $content
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
</head>
<body>
<div class="block">
	<?php include './skins/'.Core::$SKIN.'/static/menu/header.tpl'; ?>
	<?php echo $content; ?>

    <div class="conteiner-content">
		<?php include './skins/'.Core::$SKIN.'/static/menu/footer.tpl'; ?>
    </div>
</div>
</body>
</html>
