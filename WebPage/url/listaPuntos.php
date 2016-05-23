<!DOCTYPE html>
<html>
	<head>
		<script>document.title = "Puntos Limpios";</script>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
	</head>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapsePL">Puntos Limpios</a>
						</div>
						<div id="collapsePL" class="panel-collapse in">
							<div class="panel-body">
								<form class="form-inline" action="?s=puntos_limpios_handler" method="post">
									<div class="form-group">
									  <label for="tipoBusq">Tipo de Busqueda:</label>
                    <select class="form-control" id="tipo" name="tipo" onchange=madeDetalleEstadoBasura()>
                      <option value="estado">Por Cantidad de Basura</option>
                    </select>
                    <select class="form-control" id="criterio" name="criterio">
                      <option value="up">Por sobre o igual al valor:</option>
                      <option value="down">Por debajo o igual al valor:</option>
                    </select>
                    <input type="range" id="slider" name="slider" onchange="actualizarSlider()" onmousemove="actualizarSlider()"  min="0" max="100" value="0" /><p id="mostrarSlider">0%</p>
                    <input class="btn btn-primary" type="submit" value="OK">
									</div>
									<br>
									<label>Ubicación:</label>
									<div id="map" style="width:640px;height:380px;"></div>
									<br>
								</form>
								<?php
								if(isset($_SESSION["params"])){
									$ubicaciones = puntosLimpios($_SESSION["params"]);
									$tabla = '<div class="panel panel-info">
							      <div class="panel-heading">
							        <h3 class="panel-title">Información Regillas:</h3>
							      </div>
							      <div class="panel-body">
							          <table class="table table-striped table-hover ">
							            <thead>
							              <tr class="info">
							                <th>Dirección</th>
							                <th>tipo</th>
							                <th>Capacidad Actual</th>
							              </tr>
							            </thead>
							            <tbody>';
									for($i=0;$i<count($ubicaciones);$i++){
										$tabla.='<tr id="'.$i.'" name="rows"><td>'.$ubicaciones[$i]["direccion"].'</td><td>'.$ubicaciones[$i]["tipo"].'</td><td>'.$ubicaciones[$i]["estado"].'%</td></tr>';
									}
									$tabla.= '</tbody></table></div></div>';
									echo $tabla;
								}
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    <script >
      <?php
        if (isset($_SESSION["params"])) {
          unset($_SESSION["params"]);
          echo "var locations = [";
          for($i=0;$i<count($ubicaciones);$i++){
            $lugar = explode(',',$ubicaciones[$i]["direccion"],3);
            $lugar = $lugar[0].', '.$lugar[1];
            echo "['{$lugar}',{$ubicaciones[$i]["posx"]},{$ubicaciones[$i]["posy"]},{$i}],";
          }
          echo "];";
          echo "madeMap(locations);";
        }
        else {
          echo "madeMap();";
        }
      ?>
    </script>
	</body>
</html>
