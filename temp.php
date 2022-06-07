<?php
session_start();
echo '<pre>';
echo 'куки:';
print_r($_COOKIE);
echo 'сессия:';
print_r($_SESSION);
echo '</pre>';
