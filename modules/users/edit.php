<?php
/**
 * @var $row array
 */

include './modules/admin/users/full.php';
include './modules/admin/users/main.php';

if (isset($_SESSION['user']) && $_SESSION['user']['id'] == (int)$_GET['id']) {
    uploadAvatarUser();
    editUserCabinet();
} else {
    //echo 'это не ваш профиль';
    header('Location: /');
    exit();
}

