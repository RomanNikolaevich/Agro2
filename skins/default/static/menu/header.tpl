<?php
/** @var $adminVisability bool */
/** @var $adminVisability2 bool */
?>

<nav class="container-nav">
	<div class="item"><a href="/">main</a></div>
	<div class="item"><a href="/news">news</a></div>
    <div class="item"><a href="/goods">goods</a></div>
	<div class="item"><a href="/books">books</a></div>
	<div class="item"><a href="/partners">partners</a></div>
	<div class="item"><a href="/contacts">contacts</a></div>
	<div class="item"><a href="/comments">comments</a></div>
	<div class="item"><a href="/game">game</a></div>

	<?php
		if(empty($_SESSION['user'])) { ?>
			<!--<div class="item"><a id="open_pop_up_login" href="/auth/login">login</a></div>-->
            <div class="item"><a id="open_pop_up" href="/auth/regin">regin</a></div>
			<?php
		}
		elseif(!empty($_SESSION['user'])) { ?>
            <div class="item"><a href="/admin/static/main">admin</a></div>
            <div class="item"><a href="/auth/logout">logout</a></div>
    <div>
			<?php
			if(!empty($_SESSION['user'])) {
				echo 'welcome '.$_SESSION['user']['login'];
                if(isset($_SESSION['user'])
                        && $_SESSION['user']['access'] === ADMIN
                        || $_SESSION['user']['access'] == SUPER_ADMIN) {
                ?>
                <br><a href="/admin/users/full?id=<?= $_SESSION['user']['id'] ?? '' ?>" style="text-decoration: none; color:black;">Ваш профиль</a>
			<?php } else { ?>
                <br><a href="/users/main?id=<?= $_SESSION['user']['id'] ?? '' ?>" style="text-decoration: none; color:black;">Ваш профиль</a>
     </div>
        <?php } }
	} ?>

</nav>
<div class="container-logo"><img src="/skins/default/img/logo.png" alt="logo">
	<h2>THE BEST QUALITY PRODUCT</h2>
</div>
