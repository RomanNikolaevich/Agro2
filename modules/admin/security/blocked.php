<?php
//Запрет доступа к странице заблокированным пользователям (access = Blocked) и не авторизированным
if(isset($_SESSION['user'])) {
    $res = q("
            SELECT *
            FROM `users`
            WHERE `id` = ".$_SESSION['user']['id']."
            LIMIT 1
        ");
    $_SESSION['user'] = mysqli_fetch_assoc($res);
    if($_SESSION['user']['access'] == BLOCKED) {
        $_SESSION['info'] = 'К сожалению Ваш аккаунт был заблокирован, поэтому вы не сможете просматривать данную страницу.';
        logout(); //header("Location: /auth/logout");//
        exit();
    }
} else {
        $_SESSION['info'] = 'Доступ к этому разделу только для авторизированных пользователей';
        header("Location: /");
        exit();
    }

