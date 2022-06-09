<?php

//ЧПУ
if(isset($_GET['route'])) {
	$temp = explode('/', $_GET['route']);
    //подключаем админку:
    if($temp[0] == 'admin') {
        Core::$CONT = Core::$CONT.'/admin'; //заменяем папку modules на modules/admin
        Core::$SKIN = 'admin'; //заменяем папку default на admin
        unset($temp[0]);
    }
    //ЧПУ для сайта
    $i = 0;
	foreach ($temp as $k=>$v) {
		if($i == 0) {
			if(!empty($v)) {
				$_GET['module'] = $v;
			}
		} elseif($i == 1) {
			if(!empty($v)) {
				$_GET['page'] = $v;
			}
		} else {
			$_GET['key'.($k-1)] = $v;
		}
		++$k;
	}
	unset($_GET['route']);
}
//wtf($_GET); //проверка вывода ЧПУ

//Проверка на существование страниц
if(Core::$SKIN != 'admin') {
    $allowed = array('static', 'auth', 'comments', 'contacts', 'errors', 'game', 'goods', 'news','partners', 'services', 'voting');

    if(!isset($_GET['module'])) {
        $_GET['module'] = 'static';
    } elseif(!in_array($_GET['module'],$allowed) && Core::$SKIN != 'admin') {
        header("Location: /errors/404");
        exit();
    }
}

if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}

//Обрезаем пост - проверить потом как работает
if(isset($_POST)) {
    $_POST =trimAll($_POST);
}
