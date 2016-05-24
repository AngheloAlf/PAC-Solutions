<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Crear Punto Limpio";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
		<script>
			var mapPL;
			var myCenterPL;
			var markerPL;
			mapaPuntoLimpio();
		</script>
	</head>

	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapsePL">Añadir Empresa</a>
						</div>
						<div id="collapsePL" class="panel-collapse in">
							<div class="panel-body">
								<form action="?s=crearEmpresa" method="post">
									<label>Ubicación Empresa:</label>
									<div id="googleMapPL" style="width:640px;height:380px;"></div>
									<br>

									<label>Latitud:</label>
									<p class="form-control" id="coordX"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorX" name="coorX"/>
									<label>Longitud:</label>
									<p class="form-control" id="coordY"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorY" name="coorY"/>
									<label>Dirección:</label>
									<p class="form-control" id="dir"></p>
									<input type="text" hidden="True" required="" class="form-control" id="direccion" name="direccion"/>
                  <label for="nombre">Nombre:</label>
                  <input type="text" required="" class="form-control" name="nombre"/>
                  <label for="nombre">Telefono/Celular:</label>
                  <input type="text" required="" class="form-control" name="nroContacto"/>
                  <label for="nombre">Tipo:</label>
                  <input type="text" required="" class="form-control" name="tipo"/>
                  <br>
									<button class="btn btn-primary">Crear</button>
									<br>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
