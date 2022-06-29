<?php
/**
* @var $userAgeAvg array
 * @var $userAgeMin array
 * @var $userAgeMax array
 * @var $userCount array
 * @var $userAgeSum array
 */
?>
<h5>Статистика по пользователям:</h5>
<p>
    <b>Общее количество пользователей: </b> <?= $userCount['count'] ?? ''; ?><br>
    <b>Заблокированных пользователей (Blocked): </b> <?= $blockedCount['count'] ?? ''; ?> <br>
    <b>Новых пользователей (NewUser): </b> <?= $newUserCount['count'] ?? ''; ?> <br>
    <b>Обычных пользователей (Regular): </b> <?= $regularCount['count'] ?? ''; ?> <br>
    <b>Админов (Admin): </b> <?= $adminCount['count'] ?? ''; ?> <br>
    <b>Суперадминов (SuperAdmin): </b> <?= $superAdminCount['count'] ?? ''; ?> <br>
</p>
<p>
    <b>Возраст пользователей: </b> от <?= round($userAgeMin['age']) ?? ''; ?>  до <?=
    round($userAgeMax['age']) ?? ''; ?> лет<br>
    <b>Средний возраст: </b> <?= round($userAgeAvg['age']) ?? ''; ?> лет<br>
    <b>Суммарный возраст: </b> <?= round($userAgeSum['age']) ?? ''; ?> лет<br>
</p>
