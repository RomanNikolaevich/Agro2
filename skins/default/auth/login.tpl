<?php
if (empty($_SESSION['user'])) {
    include './modules/auth/login.php';
    ?>
    <!-- Блок авторизации -->
    <div class="modal_login" id="modal_login">
        <div class="modal_login_container">
            <div class="modal_login_body" id="modal_login_body">
                <p>Форма входа</p>
                <form method="post" onsubmit="return lengthCheckLogin();">
                    <input type="text" name="login_auth" id="login_auth" placeholder="Логин" required>
                    <input type="password" name="password_auth" id="password_auth" placeholder="Пароль" required>
                    <button name="do_login">Авторизироваться</button>
                    <label style="text-align:left; display: inline-flex; padding: 0px;">
                        <input type="checkbox" name="autoauthconfirm" id="autoauthconfirm">Запомнить меня
                     </label>
                </form>
                <div class="modal_authorization_close" id="modal_authorization_close">&#10006</div>
            </div>
        </div>
    </div>
    <!-- Конец блока авторизации -->
<?php
} else { ?>
    <div class="col"><?=$_SESSION['reg'] ?? ''?></div>
<?php
} ?>
