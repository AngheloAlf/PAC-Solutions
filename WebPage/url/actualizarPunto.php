<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Indicar estado de Punto Limpio";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
		<?php
			$arreglo = array();
			$puntosLimpios = obtenerPuntosLimpios();

			foreach($puntosLimpios as $key => $value){
				array_push($arreglo, '"'.implode('", "', $value).'"');
			}
			echo "<script>var PuntosLimpios = [";
			echo implode(", ", $arreglo);
			echo "];</script>";
		?>
		<script>
			var mapActu;
			var myCenterActu;
			var markerActu = [];
			mapaActualizar();
		</script>
	</head>

	<body style="background-color:gainsboro" onresize="resizeGoogleMap('googleMapActu', 'collapseActu')">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%;"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 88%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseActu">Actualizacion de estado de Punto Limpio</a>
						</div>
						<div id="collapseActu" class="panel-collapse in">
							<div class="panel-body">
								<form action="?s=indicarEstadoPunto" method="post">
									<label>Ubicación:</label>
									<div id="googleMapActu" style="width:640px;height:380px;"></div>

									<label>Dirección:</label>
									<p class="form-control" id="dir"></p>
									<!--<br>-->

									<label hidden="True">Latitud:</label>
									<p hidden="True" class="form-control" id="coordX"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorX" name="coorX"/>
									<label hidden="True">Longitud:</label>
									<p hidden="True" class="form-control" id="coordY"></p>
									<input type="text" hidden="True" required="" class="form-control" id="coorY" name="coorY"/>

									<!--<br>-->
									<table>
										<tr>
											<td style="text-align:center;"><img src="resources/mallaReciclaje.png" alt="MallaReciclaje" height="360" width="208"></td>
											<td><input type="range" id="slider" name="slider" onchange="actualizarSlider()" onmousemove="actualizarSlider()" orient="vertical" min="0" max="100" value="0" /><p id="mostrarSlider">0%</p></td>
										</tr>
									</table>

									<br>
									<br>
									<div style="text-align:right; width: 95%;font-style:italic;">
										<button class="btn btn-primary">Actualizar</button>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>resizeGoogleMap('googleMapActu', 'collapseActu')</script>
</html>
