<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="margin-top:3%;padding:0px 15% 0px 15%"';} ?> >
	<div class="row-fluid">
		<div class="panel w3-xlarge w3-topnav w3-blue">
			<div class="panel-heading">
				<a href="?page=home">
					<img src="resources/home-white.png" alt="Home" style="width:32;height:38;border:0">
				</a>
				<a href="?page=actualizarPunto">Indicar estado del punto limpio</a>
				<a href="?page=listaPuntos">Puntos Limpios</a>
				<a href="?page=solicitudComunidad">Solicitud Junta de Vecinos</a>
				<a href="?page=admin">Login Admin</a>
			</div>
		</div>
	</div>
</div>
