<?php
/**
 * @var $link
 */

$users = q("
	SELECT *
	FROM `users`
	WHERE 	`id` = ".(int)$_GET['id']."
	Limit 1
	");

if(!mysqli_num_rows($users)) {
    $_SESSION['info'] = 'Данного пользователя не существует!';
    header("Location: /admin/users");
    exit();
}

$row = mysqli_fetch_assoc($users);

//Поиск времени последней активности пользователя
function timeActivity($row){
if(!empty($row['date_activ'])){
    $difference = time() - $row['date_activ'];
    echo 'Последняя активность была: ';
    echo round($difference/(60*60*24)).' дней ';
    echo round($difference/(60*60)).' часов ';
    echo round($difference/(60)).' минут назад ';
    echo '( '.date('Y-m-d H:i:s', $row['date_activ']).' )';
} else {
    echo 'Дата последней активности - неизвестна';
}
}



