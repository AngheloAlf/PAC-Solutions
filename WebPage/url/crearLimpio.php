<!DOCTYPE html>
<html>
	<head>
		<script src="http://maps.googleapis.com/maps/api/js"></script>
		<script>
			var map;
			var myCenter=new google.maps.LatLng(-33.0430962,-71.6184219);

			function initialize(){
			var mapProp = {
				center:myCenter,
				zoom:13,
				mapTypeId:google.maps.MapTypeId.ROADMAP
				};

				map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

				google.maps.event.addListener(map, 'click', function(event){
					placeMarker(event.latLng);
				});
			}
			var marker;
			var latitud;
			var longitud;
			var direccion;
			function placeMarker(location){
				if(typeof(marker) != 'undefined'){
					marker.setMap(null);
				}
				marker = new google.maps.Marker({position: location, map: map,});
				latitud = location.lat();
				longitud = location.lng();
				direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
				//http://maps.googleapis.com/maps/api/geocode/json?latlng=44.4647452,7.3553838&sensor=true
				document.getElementById('coorX').value = latitud;
				document.getElementById("coordX").innerHTML = latitud;
				document.getElementById('coorY').value = longitud;
				document.getElementById("coordY").innerHTML = longitud;
				//alert($.getJSON(direccion));
				$.getJSON(direccion, function(result){
		            var address = result.results[0].formatted_address;
		            document.getElementById('direccion').value = address;
					document.getElementById("dir").innerHTML = address;
				
		        });
				/*var infowindow = new google.maps.InfoWindow({
					content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
				});
				infowindow.open(map,marker);*/
			}

			google.maps.event.addDomListener(window, 'load', initialize);
		</script>
	</head>

	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapse">Creación de Punto Limpio</a>
						</div>
						<div id="collapse" class="panel-collapse in">
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
									<div id="googleMap" style="width:500px;height:380px;"></div>
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
