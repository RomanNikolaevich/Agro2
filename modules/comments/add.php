<?php
//echo '<pre>' . print_r($_GET, 1) . print_r($_POST, 1) . '</pre>';
$errors = [];
if (isset($_POST['login'], $_POST['comment']) && !empty($_POST['login']) && !empty($_POST['comment'])){
    if (mb_strlen($_POST['comment']) < 10) {
        echo 'Длинна отзыва меньше 10 символов!'; // не работает - все равно записывает в БД
    } else {
        //echo 'ok'; //выведем ок
        $login = mres(trim($_POST['login']));
        $comment = mres(trim($_POST['comment']));
        q("INSERT INTO `comments` SET `name`='$login', `text`='$comment'");
        $array = array (
            'login' => $login,
            'comment' => $comment
        );
        //дописываем в массив статус:
        $array['status'] = 'ok';
        echo json_encode($array);
    }
} else {
    if (empty($_POST['login']))  {
        $errors['comment'] = 'Вы не авторизированы';
    } elseif (empty($_POST['comment'])) {
        $errors['comment'] = 'Коментарий пустой';
    }
}
exit();
