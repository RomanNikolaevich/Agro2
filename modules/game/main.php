<?php
$basehp = 10;
$letsFight = rand(1, 3);

if(empty($_SESSION['server'])) {//если клиента не существует
	$_SESSION['client'] = $_SESSION['server'] = $basehp;
}

if(isset($_POST['newgame'])) {//если создана новая игра
	$_SESSION['client'] = $_SESSION['server'] = $basehp;
}

if(isset($_POST['mynum'])) {
	if($_POST['mynum'] == $letsFight) {
		$_SESSION['client'] = $_SESSION['client'] - rand(1, 4);
	}
	elseif(!empty($_POST['mynum'])) {
			$_SESSION['server'] = $_SESSION['server'] - rand(1, 4);
		}
	}

if($_SESSION['client'] < 1 || $_SESSION['server'] < 1) {
	header('Location: /game/gameover', true, 303);
}
