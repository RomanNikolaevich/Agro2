<?php
/**
 * @var $pagePath
 */
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Roma Agro test site</title>
    <link href="/skins/default/css/bootstrap.min.css" rel="stylesheet">
    <link href="/skins/default/css/normalize.css" rel="stylesheet"/>
    <link href="/skins/default/css/style.css" rel="stylesheet">
</head>
<body>
<div class="block">
	<?php include './skins/' . Core::$SKIN . '/static/menu/header.tpl'; ?>
	<?php include $_GET['module'] . '/' . $_GET['page'] . '.tpl'; ?>

    <div class="conteiner-content">
		<?php include './skins/' . Core::$SKIN . '/static/menu/footer.tpl'; ?>
    </div>
</div>
</body>
</html>
