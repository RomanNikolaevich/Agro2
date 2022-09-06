<?php
//echo '<pre>' . print_r($_GET, 1) . print_r($_POST, 1) . '</pre>';
$errors = [];
$response = ['status' => 'no'];
if (isset($_POST['login'], $_POST['comment']) && !empty($_POST['login']) && !empty($_POST['comment'])) {
    $login = mres(trim($_POST['login']));
    $comment = mres(trim($_POST['comment']));
    q("INSERT INTO `comments` SET `name`='$login', `text`='$comment'");
    $response = [
        'login'   => $login,
        'comment' => $comment,
    ];
    //дописываем в массив статус:
    $response['status'] = 'ok';
    echo json_encode($response);
    exit();
} else {
    if (empty($_POST['login'])) {
        $errors['comment'] = 'Вы не авторизированы';
    } elseif (empty($_POST['comment'])) {
        $errors['comment'] = 'Коментарий пустой';
    }
}
if (count($errors)) {
    $response['errors'] = $errors;
}
echo json_encode($response);
exit;
