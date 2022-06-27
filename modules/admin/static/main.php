<?php
if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != BLOCKED) {
    include './modules/auth/login.php';
}

activityUpdate();
