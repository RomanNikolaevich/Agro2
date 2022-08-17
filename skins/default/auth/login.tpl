<?php
if (empty($_SESSION['user'])) {
    include './modules/auth/login.php';
    ?>
    <div class="clearfix"></div>
<!--    <div class="button_auth">
        <a id="open_pop_up" href="#">Авторизация</a>
    </div>-->
    <div class="pop_up" id="pop_up">
        <div class="pop_up_container">
            <div class="pop_up_body">
            <div class="pop_up_body_login" id="pop_up_body_login">
                <p>Форма входа</p>
                <form method="post">
                    <input type="text" name="login" placeholder="Логин" required>
                    <input type="password" name="password" placeholder="Пароль" required>

                    <button name="do_login">Авторизироваться</button>
                    <!--<div class="clearfix"></div>-->
                    <label style="text-align:left; display: inline-flex; padding: 0px;">
                        <input type="checkbox" name="autoauthconfirm" id="autoauthconfirm">Запомнить меня
                     </label>
<!--                    <div class="pop_up_body_reg_link">
                        <a style=" text-decoration: none; color: white;" id="pop_up_body_reg_link"
                           href="/auth/regin">Зарегистрироваться</a>
                    </div>-->
                </form>
                <div class="pop_up_close" id="pop_up_close">&#10006</div>
            </div>
        </div>
    </div>
    </div>
<?php
} else { ?>
    <div class="col"><?=$_SESSION['reg'] ?? ''?></div>
<?php
} ?>
