<nav class="navbar navbar-inverse">
	<div class="container" >
		<div class="text-center" style="padding-top:10px">
			<h6>Bienvenido <?php if(isset($_SESSION["user_admin"])){echo "Sr ".$_SESSION["user_admin"]["nombre"];} ?></h6>
			<?php
			if(!$_SESSION["js"]){
				echo "<br><h6>Su navegador parece no ser compatible con JavaScript.<br> Puede que algunas caracteristicas de esta pagina no funcionen como deberian.</h6>";
			}
			?>
		</div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Valpo Interviene</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
			<ul class="nav navbar-nav">
				<!--<li><a href="inscrip_curso.php">Inscribir Cursos</a></li>-->
				<li class="active"><a href="admin_index.php?page=crearLimpio">Creacion de punto limpio<span class="sr-only">(current)</span></a></li>
				<li><a href="admin_index.php?page=verSolicitudes">Ver solicitudes de juntas de vecinos</a></li>
				<li><a href="admin_index.php?page=listaPuntos">Puntos Limpios</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="?s=logOut">Salir</a></li>
			</ul>
		</div>	
	</div>
</nav>
