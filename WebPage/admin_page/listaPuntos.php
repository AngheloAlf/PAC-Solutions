<?php
	include "sv_adodb5/common.php";
	if(isset($_POST["tipo"]) && isset($_POST["criterio"]) && isset($_POST["slider"])){
		$_SESSION["params"] = array("tipo"=>$_POST["tipo"],"criterio"=>$_POST["criterio"],"valor"=>$_POST["slider"]);
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Puntos Limpios";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
	</head>
	<body style="background-color:gainsboro" onresize="resizeGoogleMap('map', 'collapsePL')">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 88%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapsePL">Puntos Limpios</a>
						</div>
						<div id="collapsePL" class="panel-collapse in">
							<div class="panel-body">
								<form style="text-align:center;" class="form-inline" action="" method="post">
									<div class="form-group">
										<label for="tipoBusq">Tipo de Busqueda:</label>
										<select class="form-control" id="tipo" name="tipo" onchange=madeDetalleEstadoBasura()>
											<option value="estado">Por Cantidad de Basura</option>
										</select>
										<select class="form-control" id="criterio" name="criterio">
											<option value="up">Por sobre o igual al valor:</option>
											<option value="down">Por debajo o igual al valor:</option>
										</select>
										<br>
										<input type="range" id="slider" name="slider" onchange="actualizarSlider()" onmousemove="actualizarSlider()"	min="0" max="100" value="0" /><p id="mostrarSlider">0%</p>
										<div style="text-align:right;"><input class="btn btn-primary" type="submit" value="OK"></div>
									</div>
									
								</form>
								<?php
								if(isset($_SESSION["params"])){
									$ubicaciones = puntosLimpios($_SESSION["params"]);
									$tabla = '
									<label>Ubicación:</label>
									<div id="map" style="width:640px;height:380px;"></div>
									<br>

									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">Información Regillas:</h3>
										</div>
										<div class="panel-body">
												<table class="table table-striped table-hover ">
													<thead>
														<tr class="info">
															<th>Dirección</th>
															<th>Tipo</th>
															<th>Capacidad Actual</th>
														</tr>
													</thead>
													<tbody>';
									for($i=0;$i<count($ubicaciones);$i++){
										$tabla.='<tr id="'.$i.'" name="rows"><td>'.$ubicaciones[$i]["direccion"].'</td><td>'.$ubicaciones[$i]["tipo"].'</td><td>'.$ubicaciones[$i]["estado"].'%</td></tr>';
									}
									$tabla.= '</tbody></table></div></div>
									
									<br>';
									echo $tabla;
								}
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<?php
				if (isset($_SESSION["params"])) {
					unset($_SESSION["params"]);
					echo "<script>var locations = [";
					for($i=0;$i<count($ubicaciones);$i++){
						$lugar = explode(',',$ubicaciones[$i]["direccion"],3);
						$lugarl = $lugar[0].', '.$lugar[1];
						echo "['{$lugarl}',{$ubicaciones[$i]["posx"]},{$ubicaciones[$i]["posy"]},{$i}],";
					}
					echo "];";
					echo "madeMap(locations);</script>";
				}
			?>
	</body>
	<script>resizeGoogleMap('map', 'collapsePL')</script>
</html>
