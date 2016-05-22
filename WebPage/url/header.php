<header>
	<div class="text-center" style="padding-top:10px">
		<h1>Valpo Interviene</h1>
		<h3>Bienvenido <?php if($_SESSION["logeado"]){ echo $_SESSION["user"];} ?></h3>
		<?php
		if(!$_SESSION["js"]){
			echo "<br><h6>Su navegador parece no ser compatible con JavaScript.<br> Puede que algunas caracteristicas de esta pagina no funcionen como deberian.</h6>";
		}
		?>
	</div>
	<?php include 'topnav.php'; ?>
	<br>
</header>