<?php

//ЧПУ
if(isset($_GET['route'])) {
	$temp = explode('/', $_GET['route']);
	foreach ($temp as $k=>$v) {
		if($k == 0) {
			if(!empty($v)) {
				$_GET['module'] = $v;
			}
		} elseif($k == 1) {
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
$allowed = array('static', 'admin','auth', 'comments', 'contacts', 'errors', 'game', 'goods', 'news','partners', 'services', 'voting');

if(!isset($_GET['module'])) {
	$_GET['module'] = 'static';
} elseif(!in_array($_GET['module'],$allowed)) {
	//exit();
	header("Location: /errors/404");
	exit();
}

if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}

