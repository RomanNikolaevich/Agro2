<?php
//Всего пользователей:
$qUserCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE 1;
    ");
$userCount = mysqli_fetch_assoc($qUserCount);
//echo round($userCount['count']);

//Заблокированных пользователей (Blocked):
//SELECT * FROM `users` WHERE `access` = 'Blocked';
$qBlockedCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE `access` = 'Blocked';
    ");
$blockedCount = mysqli_fetch_assoc($qBlockedCount);

//Новых пользователей (NewUser):
$qNewUserCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE `access` = 'NewUser';
    ");
$newUserCount = mysqli_fetch_assoc($qNewUserCount);

//Обычных пользователей (Regular):
$qRegularCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE `access` = 'Regular';
    ");
$regularCount = mysqli_fetch_assoc($qRegularCount);

//Админов (Admin):
$qAdminCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE `access` = 'Admin';
    ");
$adminCount = mysqli_fetch_assoc($qAdminCount);

//Суперадминов (SuperAdmin):
$qSuperAdminCount = q("
SELECT COUNT(*) AS 'count' FROM `users` WHERE `access` = 'SuperAdmin';
    ");
$superAdminCount = mysqli_fetch_assoc($qSuperAdminCount);

//минимальный возраст:
$qAgeMin = q("
SELECT MIN(`age`) AS 'age' FROM `users` WHERE 1;
    ");
$userAgeMin = mysqli_fetch_assoc($qAgeMin);
//echo round($userAgeMin['age']);

//максимальный возраст:
$qAgeMax = q("
SELECT MAX(`age`) AS 'age' FROM `users` WHERE 1;
    ");
$userAgeMax = mysqli_fetch_assoc($qAgeMax);
//echo round($userAgeMax['age']);

//средний возраст:
$qAgeAvg = q("
SELECT AVG(`age`) AS 'age' FROM `users` WHERE 1;
    ");
$userAgeAvg = mysqli_fetch_assoc($qAgeAvg);
//echo round($userAgeAVG['age']);

//Суммарный возраст:
$qAgeSum = q("
SELECT SUM(`age`) AS 'age' FROM `users` WHERE 1;
    ");
$userAgeSum = mysqli_fetch_assoc($qAgeSum);
//echo round($userAgeSum['age']);

