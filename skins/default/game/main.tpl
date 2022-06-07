<div class="container mt-4">
	<div class="row">
		<div class="col">
			<h1 class="h1" style="color:#083a90">Алкобатл</h1>
			<p>Цели игры: разобраться в сессиях и переадресациях.
				<br>Попробовать на практике изученную самостоятельно функцию rand();
				<br>Далее через форму мы вводим число от 1 до 3,
				<br>компьютер тоже выбрасывает случайное число от 1 до 3.
				<br>Если наше число совпало со случайным числом компьютера,
				<br>то мы проиграли этот бой у компьютера и у нас отнимается от 1 до 4 хп
				<br>Если число не совпало со случайным числом компьютера
				<br>то мы выиграли у компьютера отнимая от 1 до 4 хп<br>
				После победы происходит перенос на новую страничку</p>
			<form action="" method="post" name="alcobattle">
				введите число <input type="number" name="mynum" min="1" max="3" class="form-control"
									 placeholder="от 1 до 3"><br>
				<button type="submit" name="fight" class="btn-lg">В бой</button>
				<p>Вы выбросили число: <?php
					if (!empty($_POST['mynum'])) {echo $_POST['mynum'];} ?></p>
				<p>Компьютер выбросил: <?php
					if (!empty($letsFight)) {echo $letsFight;} ?></p>
				<p>Ваше здоровье: <?php
					if (!empty($_SESSION['client'])) {echo $_SESSION['client'];} ?></p>
				<p>Здоровье противника: <?php
					if (!empty($_SESSION['server'])) {echo $_SESSION['server'];} ?></p>
				<input type="submit" name="newgame" class="btn-lg" value="Начать новую битву">
			</form>
		</div>
	</div>
</div>
