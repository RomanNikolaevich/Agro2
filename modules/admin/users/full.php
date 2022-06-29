<?php
/**
 * @var $link
 */

$users = q("
	SELECT *
	FROM `users`
	WHERE 	`id` = " . (int)$_GET['id'] . "
	Limit 1
	");

if (!mysqli_num_rows($users)) {
    $_SESSION['info'] = 'Данного пользователя не существует!';
    header("Location: /admin/users");
    exit();
}

$row = mysqli_fetch_assoc($users);

//Меняем формат вывода даты регистрации:
$qDateReg = q("
	SELECT *, DATE_FORMAT(date_reg, '%d.%m.%Y %T (%W)') AS 'date_reg'
	FROM `users`
	WHERE 	`id` = " . (int)$_GET['id'] . "
	
	");
$dateReg = mysqli_fetch_assoc($qDateReg);

//Поиск времени последней активности пользователя
function timeActivity($row)
{
    if (!empty($row['date_activ'])) {
        $difference = time() - $row['date_activ'];
        $diffDay = floor($difference / (60 * 60 * 24));
        $diffHour = floor($difference / (60 * 60));
        $diffMinute = round($difference / (60));
        echo 'Последняя активность была: ';
        echo $diffDay > 0 ? $diffDay . ' дней ' : 'сегодня ';
        for ($i = $diffHour; $i >= 0; $i = $i - 24) {
            if ($i < 24) {
                echo $i . ' часов ';
            }
        }
        for ($i = $diffMinute; $i > 0; $i = $i - 60) {
            if ($i <= 59) {
                echo $i . ' минут назад ';
            }
        }
        echo '( ' . date('d.m.Y H:i:s', $row['date_activ']) . ' )';
    } else {
        echo 'Дата последней активности - неизвестна';
    }
}

//Проверка длинны текста сделать (в БД ограничение в 1000 символов)
