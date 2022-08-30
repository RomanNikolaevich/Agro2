<?php
echo '<pre>' . print_r($_GET, 1) . print_r($_POST, 1) . '</pre>';
$errors = [];
if (isset($_POST['do_signup'])) {
    if (!isset($_POST['login'], $_POST['comment'])) {
        $errors['comment'] = 'комментарий не  заполнен';
    } else {
        if (empty($_POST['comment'])) {
            $errors['comment'] = 'Коментарий пустой';
        } elseif (mb_strlen($_POST['comment']) < 10) {
            $errors['comment'] = 'Длинна отзыва меньше 10 символов!';
        } else {

            $login = mres(trim($_POST['login']));
            $comment = mres(trim($_POST['comment']));

            //Защита от спама со ссылками:
            //validateName($comment);

            $result = q("INSERT INTO `comments` SET `name`='$login', `text`='$comment'");
            // wtf($result);
            json_encode(['login' => $login, 'comment' => $comment]);
        }
    }
}
//exit();
