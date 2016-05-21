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
							<a data-toggle="collapse" href="#collapsePL">Creación de Punto Limpio</a>
						</div>
						<div id="collapsePL" class="panel-collapse in">
							<div class="panel-body">
								<form action="?s=crearPunto" method="post">
									<label>Tipo de Punto Limpio:</label>
									<select class=form-control required="" id="tipoPL" name="tipoPL">
										<option value="Botellas">Botellas</option>
										<option value="Latas">Latas</option>
										<!-- ¿Que mas se puede reciclar? -->
									</select>
									<br>
									<label>Ubicación:</label>
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
