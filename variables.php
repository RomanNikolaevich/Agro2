<?php

//ЧПУ
if(isset($_GET['route'])) {
	$temp = explode('/', $_GET['route']);
    //подключаем админку:
    if($temp[0] == 'admin') {
        Core::$SKIN = 'admin'; //заменяем папку default на admin - для скинов
        Core::$CONT = Core::$CONT.'/admin'; //заменяем папку modules на modules/admin - для плагинов
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
		++$i;
	}
	unset($_GET['route']);
}
//dd($_GET); //проверка вывода ЧПУ
//exit();

//Проверка на существование страниц
//Переделываем исключения и подключаем модуль статичных страниц с проверкой в БД:
if(!isset($_GET['module'])) {
    $_GET['module'] = 'static';
} else {//формируем массив:
    $res = q("
        SELECT *
        FROM `pages`
        WHERE `module` = '".mres($_GET['module'])."'
        LIMIT 1
    ");
    if (!$res->num_rows) {//!mysqli_num_rows($res)
        error404 ();
    } else { //проверка на статичность страницы:
        $staticpage=$res->fetch_assoc(); //mysqli_fetch_assoc($res);
        $res->close();//закрываем соединение
        if ($staticpage['static']==1) {//проверка
            $_GET['module'] = 'staticpage';
            $_GET['page'] = 'main';
        }
    }
}

/*добавляем исключение, чтобы массив $allowed не обрабатывался в админке:
if(Core::$SKIN != 'admin') {
    $allowed = array('static', 'auth', 'comments', 'contacts', 'errors', 'game', 'goods', 'news','partners', 'books', 'voting', 'users', 'uploaded');

    if(!isset($_GET['module'])) {
        $_GET['module'] = 'static';
    } elseif(!in_array($_GET['module'],$allowed) && Core::$SKIN != 'admin') {
        //exit();
        header("Location: /errors/404");
        exit();
    }
}*/

if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}

if(!preg_match('#^[-a-z_\d]*$#iu', $_GET['page'])) {
    error404 ();
}

//Обрезаем пост - проверить потом как работает
if(isset($_POST)) {
    $_POST =trimAll($_POST);
}

//выставил часовой пояс, чтобы корректно время на сайте совпадало
date_default_timezone_set("Europe/Kiev");
//echo date_default_timezone_get();
