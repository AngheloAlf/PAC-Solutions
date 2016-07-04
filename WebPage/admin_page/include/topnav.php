<!--<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="margin-top:3%;padding:0px 15% 0px 15%"';} ?> >
	<div class="row-fluid">
		<div class="panel w3-xlarge w3-topnav w3-blue">
			<div class="panel-heading">
				<a href="?page=home">
					<img src="resources/home-white.png" alt="Home" style="width:32;height:38;border:0">
				</a>
				<a href="?page=crearLimpio">Crear punto limpio</a>
				<a href="?page=actualizarPunto">Indicar estado del punto limpio</a>
				<a href="?page=admin">Login Admin</a>
				<a href="?page=verificador">Digito verificador</a>
				<a href="?page=google">Google search</a>
				<a href="?page=configuracion">Configuración</a>
			</div>
		</div>
	</div>
</div>-->
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
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="?s=logOut">Salir</a></li>
      </ul>
    </div>
  </div>
</nav>
