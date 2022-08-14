<?php
if (empty($_SESSION['user'])) {
    //include './modules/auth/login.php';
    Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/script.js?2"></script>';
    ?>
<script type="text/javascript" src="/skins/default/js/script.js?2"></script>;
    <div class="clearfix"></div>
    <div class="button_auth">
        <a id="open_pop_up" href="#">Авторизация</a>
    </div>
    <div class="pop_up" id="pop_up">
        <div class="pop_up_container">
            <div class="pop_up_body" id="pop_up_body">
                <p>Форма входа</p>
                <form method="post">
                    <input type="text" name="login" placeholder="Логин" required>
                    <input type="password" name="password" placeholder="Пароль" required>

                    <button name="do_login">Авторизироваться</button>
                    Запомнить меня <input type="checkbox" class="form-check-input" name="autoauthconfirm"
                                          id="autoauthconfirm"><br>

                    <a style=" text-decoration: none; color: white;"
                       href="/auth/regin">Зарегистрироваться</a>

                </form>
                <div class="pop_up_close" id="pop_up_close">&#10006</div>
            </div>
        </div>
    </div>
<?php
} else { ?>
    <div class="col"><?=$_SESSION['reg'] ?? ''?></div>
<?php
} ?>

<script>
    //модальное окно:
    const openPopUp = document.getElementById('open_pop_up');
    const closePopUp = document.getElementById('pop_up_close');
    const popUp = document.getElementById('pop_up');

    /*отслеживаем нажатие на кнопку:*/
    openPopUp.addEventListener('click', function (e) {
        e.preventDefault();
        popUp.classList.add('active');
    })

    /*выполненение действия по закрытию модального окна*/
    closePopUp.addEventListener('click', () => {
        popUp.classList.remove('active')
    })

    /*вывод сообщений*/
    var error = '<?php echo $_SESSION['reg']; ?>';
    alert(error);
</script>
