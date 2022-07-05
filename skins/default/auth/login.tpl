<?php
/**
 * @var $errorForm array
 */
?>
<div class="container mt-4">
	<div class="row">
		<div class="col">
			<!-- Форма авторизации -->
			<?php if(empty($_SESSION['user'])) {?>
			<h2>Форма входа</h2>
                <h4 style="color: red"><?php echo @$error; ?></h4>
			<form method="post">
				Логин: <input type="text" class="form-control" name="login" id="login" placeholder="Введите логин"
					   value="" required><br>
                Пароль: <input type="password" class="form-control" name="password" id="password" placeholder="Введите пароль"
					   required><br>
                Запомнить меня <input type="checkbox" class="form-check-input" name="autoauthconfirm"
                                      id="autoauthconfirm" ><br>
				<button class="btn btn-suc" name="do_login" type="submit">Авторизоваться</button>
			</form>
			<br>
			<h4 style="color:red"><?php if (!empty($errorForm['loginError'])) { echo $errorForm['loginError'];} ?></h4>
			<h4 style="color:red"><?php if (!empty($errorForm['enterError'])) { echo $errorForm['enterError'];} ?></h4>
			<p>Если вы еще не зарегистрированы, тогда нажмите здесь:</p>
			<div class="btn btn-suc" style=" text-decoration: none;">
				<a style=" text-decoration: none; color: white;"
				   href="/auth/regin">Зарегистрироваться</a>
			</div>
			<?php } else {?>
                <div class="col"><?= $_SESSION['reg'] ?? '' ?></div>
			<?php } ?>
            <!-- Конец формы авторизации -->
		</div>
	</div>
</div>
