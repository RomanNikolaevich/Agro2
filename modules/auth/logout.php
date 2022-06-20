<?php
session_unset();
session_destroy();
setcookie('autoauthid', '', time() - 3600 * 30, '/');
setcookie('autoauthhash', '', time() - 3600 * 30, '/');

// Редирект на главную страницу
header('Location: /', true, 303);//переход на главную
exit();
