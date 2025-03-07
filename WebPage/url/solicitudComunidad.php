<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Solicitud para crear comunidad";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
		<script>
			var mapSoli;
			var myCenterSoli;
			var markerSoli;
			mapaSolicitud();
		</script>
	</head>

	<body style="background-color:gainsboro" onresize="resizeGoogleMap('googleMapSoli', 'collapseSoli')">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%;"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 75%;padding: 00px;"';} ?> >
						<div class="panel-body" id="descripcionSoli" style="text-align:center;font-style:italic;">
							<i>Interfaz para solicitar un punto limpio en tu junta de vecinos.</i>
							
						</div>
					</div>
					<br>

					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 88%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseSoli">Solicitud para crear junta de vecinos</a>
						</div>
						<div id="collapseSoli" class="panel-collapse in">
							<div class="panel-body">
								<form action="?s=solicitarCrearJunta" method="post">
									
									<label>Nombre de su junta de vecinos:</label>
									<input type="text" required="" class="form-control" id="nombreJunta" name="nombreJunta" placeholder="Junta de vecinos El Bosque" />
									<label>Nombre de contacto:</label>
									<input type="text" required="" class="form-control" id="nombre" name="nombre" placeholder="Juanito Perez" />
									<label>Telefono de contacto:</label>
									<input type="tel" required="" class="form-control" id="telefono" name="telefono" placeholder="+56912345678" />
									<label>e-Mail de contacto:</label>
									<input type="mail" required="" class="form-control" id="email" name="email" placeholder="juanito.perez@mail.com" />

									<br>
									<label>Ubicación:</label>
									<div id="googleMapSoli" style="width:640px;height:380px;"></div>

									<label>Dirección:</label>
									<p class="form-control" id="dir"></p>
									<input type="text" hidden="True" required="" class="form-control" id="direccion" name="direccion"/>
									<!--<br>-->

									<label hidden="True">Latitud:</label>
									<p hidden="True" class="form-control" id="coordX"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorX" name="coorX"/>
									<label hidden="True">Longitud:</label>
									<p hidden="True" class="form-control" id="coordY"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorY" name="coorY"/>

									<!--<br>-->
									<div style="text-align:left; width: 90%;font-style:italic;">
										<button class="btn btn-primary">Solicitar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>resizeGoogleMap('googleMapSoli', 'collapseSoli')</script>
</html>
