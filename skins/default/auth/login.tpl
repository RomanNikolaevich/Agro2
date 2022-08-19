<?php
if (empty($_SESSION['user'])) {
    include './modules/auth/login.php';
    ?>
    <!-- Блок авторизации -->
    <div class="modal_login" id="modal_login">
        <div class="modal_login_container">
            <div class="modal_login_body" id="modal_login_body">
                <p>Форма входа</p>
                <form method="post">
                    <input type="text" name="login" placeholder="Логин" required>
                    <input type="password" name="password" placeholder="Пароль" required>
                    <button name="do_login">Авторизироваться</button>
                    <label style="text-align:left; display: inline-flex; padding: 0px;">
                        <input type="checkbox" name="autoauthconfirm" id="autoauthconfirm">Запомнить меня
                     </label>
<!--                    <div>
                        <a class="modal_registration_open_btn" id="modal_registration_open"
                           href="/auth/regin">Зарегистрироваться</a>
                    </div>-->
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
