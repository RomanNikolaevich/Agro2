<?php
//аутолоадер классов:
spl_autoload_register(function ($class) {
	include './libs/'.$class .'.php';
});

//Функция вывода на экран:
function wtf($variable, $stop = false) {
	echo '<pre>'.print_r($variable, 1).'</pre>';
	if($stop) {
		exit();
	}
}

//Запрос к БД с выводим ошибок
function q($query) {
    global $link;
    $result = mysqli_query($link, $query);
    if($result === false) {
        $info = debug_backtrace();
        $date= date("Y-m-d H:i:s");
        //wtf($info);//распечатка ошибки на экран
        $log = $date."  QUERY: ".$query.'<br>'
			.mysqli_error($link).'<br>'
			.'FILE: '.$info[0]['file'].
            ' LINE: '.$info[0]['line'];//дебаг(перехват ошибки)
        echo $log;
        //отправляем на почту письмо об ошибке (учить будем это в последующих уроках)
        //записываем ошибку в логи:
        file_put_contents('./logs/mysql.log', strip_tags($log)."\n\n", FILE_APPEND);
        exit(); //остановим код
    } else {
        return $result; // запрос составлен верно, то вернем на страницу $result
    }
} // пример применения: $result = q("SELECT * FROM `users` ORDER BY `id`");

/*Защищаем данные от пользователя в *.tpl.
 * В input добавляем в параметр value: value="<?php echo hsc($_POST[...])
 * Безопасность выводимой на экран информации. Преобразует специальные символы в HTML-сущности*/
function hsc($elem) {
    if(!is_array($elem)) {
        $elem = htmlspecialchars ($elem);
    } else {
        $elem = array_map('hsc', $elem);
    }
    return $elem;
}

/*Защищаем передаваемые в SQL запросы.
 * Пример: UPDATE `news` SET `cat` = '".mres(trim($_POST['cat']))."',
 *Экранирует специальные символы в строке для использования
в SQL-выражении, используя текущий набор символов соединения*/
function mres($elem) {
    global $link;
    if(!is_array($elem)) {
        $elem = mysqli_real_escape_string ($link, $elem);
    } else {
        $elem = array_map('mres', $elem);
    }
    return $elem;
}

//Удаляет пробелы (или другие символы) из начала и конца строки
function trimAll($elem) {
    if(!is_array($elem)) { //если это не массив
        $elem = trim($elem); //то мы его обработаем тримом
    } else {
        $elem = array_map('trimAll', $elem); // делаем замыкание функции самой себя и каждый раз
        // залазит глубже в массив
    }
    return $elem; //массив не будем трогать
}

function getComments($link, int $limit, int $offset) {
    $commentQuery = "SELECT * FROM `comments` ORDER BY `date` DESC LIMIT $limit OFFSET $offset";
    $commentResult = mysqli_query($link, $commentQuery);
    $comments = mysqli_fetch_all($commentResult, MYSQLI_ASSOC);

    return $comments;
}

//блок фильтра спама (запрет использования ссылок)
function validateName($comment) {
    global $errors;
    $badWords = '/\.com|\.ru|\.net|\.xyz|\.html|\.https|\.club|\.http|\.httр|\.httрs|\.url|\.org|\.by/i';
    $match = preg_match($badWords, $comment);
    if(isset($match)) {
         $errors['comment'] = 'Ваш комментарий был отклонен, так как вы используете запрещенные слова';
    }
}
//блок спама стоп слов через массив - не работает - доделать позже
function containsStopWord($comment) {
    global $errors;
    $stopWords = array ('.com', '.ru','.net','.xyz', 'https','club', 'порно', 'porno', 'пoрнo');
    foreach ($stopWords as $stopWord) {
        if (mb_stripos($comment, $stopWord) === true)
            $errors['comment'] = 'Ваш комментарий был отклонен, так как вы используете запрещенные слова';
            //return false;
    }
    //return true;
}

function myHash($var) {
	$salt = 'ABC';
	$salt2 = 'CBA';
	$var = crypt(md5($var.$salt), $salt2);
	return $var;
}

//Приводим к числу
function intArray($elem) {
    if(!is_array($elem)) {
        $elem = (int)($elem); //приводим к типу int
    } else {
        $elem = array_map('intArray', $elem);
        // делаем замыкание функции самой себя и каждый раз залазит глубже в массив
    }
    return $elem; //массив не будем трогать
}

//Приводим к float
function floatArray($elem) {
    if(!is_array($elem)) {
        $elem = (float)($elem); //приводим к типу float
    } else {
        $elem = array_map('floatArray', $elem);
    }
    return $elem; //массив не будем трогать
}

function logout() {
    session_unset();
    session_destroy();
    setcookie('autoauthid', '', time() - 3600 * 30, '/');
    setcookie('autoauthhash', '', time() - 3600 * 30, '/');
    header("Location: /");
    exit();
}

function activityUpdate() {
    if(isset($_SESSION['user'])) {
        q("
		UPDATE `users` SET
		`date_activ` = '" . time() . "',
		`ip`         = '" . ip2long($_SERVER['REMOTE_ADDR']) . "'
		WHERE `id`   = " . (int)$_SESSION['user']['id'] . "
	");
    }
    //exit();
}
//не работает как функция
function dateWeek(){
    echo date('d-m-Y', time()).'<br>';
    $week = ['воскресенье', 'понедельник', 'вторник', 'среда', 'чертверг', 'пятница', 'суббота'];
    $day = date ('w', time());
    echo $week[$day];
}

function editUserAdmin($login, $age, $date, $aboutme, $password) {
q("
    UPDATE `users` SET
    `login`       = '" . mres(trim($login)) . "',
    `age`         = '" . (int)$age . "',
    `date_reg`    = '" . mres($date) . "',
    `about`       = '" . mres(trim($aboutme)) . "'
    WHERE `id`    = " . (int)$_GET['id'] . "
");

  //если пользователь не менял пароль
if (!empty($password)) {
        q("
            UPDATE `users` SET
            `password`    = '" . myHash($password) . "'
            WHERE `id`    = " . (int)$_GET['id'] . "
        ");
    }
}

function editUserCabinet($login, $age, $aboutme, $password) {
    q("
    UPDATE `users` SET
    `login`       = '" . mres(trim($login)) . "',
    `age`         = '" . (int)$age . "',
    `about`       = '" . mres(trim($aboutme)) . "'
    WHERE `id`    = " . (int)$_GET['id'] . "
");

    //если пользователь не менял пароль
    if (!empty($password)) {
        q("
            UPDATE `users` SET
            `password`    = '" . myHash($password) . "'
            WHERE `id`    = " . (int)$_GET['id'] . "
        ");
    }
}

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

function uploadAvatarUser(){
    $array = ['image/gif', 'image/jpeg', 'image/png'];
    $array2 = ['jpg', 'jpeg', 'gif', 'png'];
    if (isset($_POST['submit'])) {
        if ($_FILES['file']['error'] == 0) {
            //wtf($_FILES['file']);
            if ($_FILES['file']['size'] < 5000 || $_FILES['file']['size'] > 50000000) {
                echo 'Размер изображения нам не подходит';
            } else {
                preg_match('#\.([a-z]+)$#iu', $_FILES['file']['name'], $matches);
                if (isset($matches[1])) {
                    $matches[1] = mb_strtolower($matches[1]);
                    $temp = getimagesize($_FILES['file']['tmp_name']);
                    //wtf($temp);
                    $name = '/uploaded/' . date('Ymd-His') . 'img' . rand(10000, 99999) . '.jpg';
                    $pattern = '#^.{10}(.+)#ui';
                    preg_match ($pattern, $name, $matches2);
                    if($temp[1]/$temp[0] < 0.4 || $temp[0]/$temp[1] <0.4){
                        echo 'не подходящая пропорция - выберите другое изображение';
                    } else {
                        if (!in_array($matches[1], $array2)) {
                            echo 'Не подходит расширение изображения';
                        } elseif (!in_array($temp['mime'], $array)) {
                            echo 'Не подходит тип файла, можно загружать только изображения';
                        } elseif (!move_uploaded_file($_FILES['file']['tmp_name'], '.'.$name)) {
                            echo 'Изображение еще не загружено! Ошибка';
                        } else {
                            echo 'Изображение загружено верно';
                            q("
                                UPDATE `users` SET
                                `img`       = '" . mres($matches2[1]) . "'
                                WHERE `id`    = " . (int)$_GET['id'] . "
                            ");
                            $temp2 = imagecreatefromjpeg ($_FILES['file']['tmp_name']);
                            wtf($temp2);
                            $id = (int)$_GET['id'];
                            if(isset($_SESSION['user'])
                                && $_SESSION['user']['access'] === ADMIN
                                || $_SESSION['user']['access'] == SUPER_ADMIN) {
                                header("Location: /admin/users/edit?id=$id");
                            } else {
                                header("Location: /users/edit?id=$id");
                            }
                        }
                    }

                } else {
                    echo 'Данный файл не являетися картинкой. Принимаемые типы файлов: jpg, png, gif';
                }
            }
        }
    }
}
