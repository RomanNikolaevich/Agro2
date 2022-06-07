<?php
if($_SESSION['server'] < 1) {
	$gamerwin = 'Игрок победил';
} elseif($_SESSION['client'] < 1) {
	$compwin = 'Компьютер победил';
}

if(!empty ($_POST['regame'])) {
	session_destroy();
	header('Location: /game', true, 303);
	exit;
}
