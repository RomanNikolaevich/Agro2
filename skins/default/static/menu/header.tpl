<?php
/** @var $adminVisability bool */
/** @var $adminVisability2 bool */
?>

<nav class="container-nav">
	<div class="item"><a href="/">main</a></div>
	<div class="item"><a href="/news">news</a></div>
    <div class="item"><a href="/goods">goods</a></div>
	<div class="item"><a href="/services">services</a></div>
	<div class="item"><a href="/partners">partners</a></div>
	<div class="item"><a href="/contacts">contacts</a></div>
	<div class="item"><a href="/comments">comments</a></div>
	<div class="item"><a href="/game">game</a></div>
	<?php
		if(empty($_SESSION['user'])) { ?>
			<div class="item"><a href="/auth/login">login</a></div>
			<?php
		} ?>
		<?php
		if(!empty($_SESSION['user'])) { ?>
			<div class="item"><a href="/auth/logout">logout</a></div>
			<?php
			if(!empty($_SESSION['user'])) {
				echo 'welcome '.$_SESSION['user']['login'];
			}
	} ?>
</nav>
<div class="container-logo"><img src="/skins/default/img/logo.png" alt="logo">
	<h2>THE BEST QUALITY PRODUCT</h2>
</div>
