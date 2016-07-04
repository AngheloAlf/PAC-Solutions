<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Ver solicitudes de juntas de vecinos";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
		<script>
			<?php
				$arreglo = array();
				if($solicitudes = obtenerSolicitudesJuntas()){
					foreach($solicitudes as $key => $value){
						array_push($arreglo, '"'.implode('", "', $value).'"');
					}
				}
				echo "var PuntosLimpios = [";
				echo implode(", ", $arreglo);
				echo "];";
			?>
			var mapVer;
			var myCenterVer;
			var markerVer;
			mapaVerSoli();
		</script>
	</head>

	<body style="background-color:gainsboro" onresize="resizeGoogleMap('googleMapVer', 'collapseVer')">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 95%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseVer">Ver solicitudes de Juntas de vecinos</a>
						</div>
						<div id="collapseVer" class="panel-collapse in">
							<div class="panel-body">
								<form action="" onsubmit="return WIP()" method="post">
									
									<label>Ubicación:</label>
									<div id="googleMapVer" name="googleMap" style="width:640px;height:380px;"></div>
									<br>

									<label>Dirección:</label>
									<p class="form-control" id="dir"></p>
									<input type="text" hidden="True" required="" class="form-control" id="direccion" name="direccion"/>
									

									<label>Latitud:</label>
									<p class="form-control" id="coordX"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorX" name="coorX"/>
									<label>Longitud:</label>
									<p class="form-control" id="coordY"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorY" name="coorY"/>

									<label>Tipo de Punto Limpio:</label>
									<select class=form-control required="" id="tipoPL" name="tipoPL">
										<option value="Botellas">Botellas</option>
										<option value="Latas">Latas</option>
										<!-- ¿Que mas se puede reciclar? -->
									</select>
									<br>

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
		<br>
		<br>
	</body>
	<script>resizeGoogleMap('googleMapVer', 'collapseVer')</script>
</html>
