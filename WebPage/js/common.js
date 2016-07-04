function WIP(){
	alert("WIP\nLa pagina esta en construccion");
	return false;
}

function digitoVerificador(sinGuion){ //Algoritmo para generar el digito verificador de el rut
	var contador = 2;
	var suma = 0;
	for(var i = sinGuion.length - 1; i >= 0; i--){
		suma += parseInt(sinGuion[i])*contador++;
		if(contador > 7){
			contador = 2;
		}
	}
	verificador = 11 - suma%11;
	if(verificador == 10){
		return "k";
	}
	if(verificador == 11){
		return "0";
	}
	return verificador.toString();
}

function rutCorrecto(rutCompleto){
	var rut = rutCompleto.split("-");
	if(digitoVerificador(rut[0]) == rut[1]){
		return true;
	}
	else{
		alert("El Rut "+rutCompleto+" no es valido.");
		return false;
	}
}

function generarDV(){
	var rut = document.getElementById("rutDV").value;
	if(!(/^[0-9]+$/.test(rut))){
		alert("Porfavor escriba su rut sin puntos, espacios ni su digito verificador.");
		return false;
	}
	document.getElementById("DV").innerHTML = "<br>Su rut es "+rut+"-"+digitoVerificador(rut);
}

function rutValido(cualRevisar){
	return rutCorrecto(document.forms[cualRevisar]["rut"].value);
}

function revisarPassword(pass1, pass2){
	if(pass1 == pass2){
		return true;
	}
	alert("Las contraseñas no coinciden.");
	return false;
}

function revisarMail(mail){
	if(/^[a-zA-Z0-9._]+@[a-zA-Z0-9._]+.[a-zA-Z0-9.]+$/.test(mail)){
		return true;
	}
	alert("El e-Mail no es valido");
	return false;
}

function crearCuenta(){
	return revisarPassword(document.getElementsByID('Cpass').value, document.getElementsByID('Cpass2').value) && revisarMail(document.getElementsByID('Cmail').value);
}

function easter_eggColor(){
	document.getElementById("easter_egg").style.backgroundColor = "white";
	document.getElementById("easter_egg").style.backgroundImage = "";
	document.getElementById("easter_egg2").style.opacity = "1.0";
	document.getElementById("easter_egg3").style.opacity = "1.0";
	document.getElementById("easter_egg4").style.opacity = "1.0";
	document.getElementById("easter_egg5").style.opacity = "1.0";
}

function easter_eggImage(){
	document.getElementById("easter_egg").style.backgroundImage = "url('resources/konga.gif')";
	document.getElementById("easter_egg").style.backgroundSize = "70px 70px";
	document.getElementById("easter_egg2").style.opacity = "0.6";
	document.getElementById("easter_egg3").style.opacity = "0.7";
	document.getElementById("easter_egg4").style.opacity = "0.7";
	document.getElementById("easter_egg5").style.opacity = "0.7";
}

//Punto Limpio
function initializePL(){
	var mapProp = {center:myCenterPL, zoom:14, mapTypeId:google.maps.MapTypeId.ROADMAP};

	mapPL = new google.maps.Map(document.getElementById("googleMapPL"),mapProp);

	google.maps.event.addListener(mapPL, 'click', function(event){ placeMarkerPL(event.latLng); });

	var marcador;
	var infowindows = [];
	var markerActu = [];
	for(var i = 0; i < (PuntosLimpios.length); i++){
		console.log(PuntosLimpios[i]+" "+PuntosLimpios[i+1]);
		marcador = new google.maps.Marker({position: {lat: parseFloat(PuntosLimpios[i]), lng: parseFloat(PuntosLimpios[i+1])}, map: mapPL,icon:"resources/pinkball.png",});		
		infowindow = new google.maps.InfoWindow({content:PuntosLimpios[i+2]});
		markerActu.push(marcador);
		infowindows.push(infowindow);
		google.maps.event.addListener(markerActu[parseInt(i/3)], 'click', function(k){
			return function(){
				for (var j = 0; j < infowindows.length; j++) {
					infowindows[j].close();
					//markerActu[j].setAnimation(null);
				}
				//markerActu[k].setAnimation(google.maps.Animation.BOUNCE);
				infowindows[k].open(mapPL, markerActu[k]);

				/*var latitud = markerActu[k].getPosition().lat();
				var longitud = markerActu[k].getPosition().lng();
				document.getElementById('coorX').value = latitud;
				document.getElementById("coordX").innerHTML = latitud;
				document.getElementById('coorY').value = longitud;
				document.getElementById("coordY").innerHTML = longitud;

				var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
				console.log(direccion);
				$.getJSON(direccion, function(result){
					var address = result.results[0].formatted_address;
					document.getElementById("dir").innerHTML = address;
				});*/
				
			}
		}(parseInt(i/3)));
		i++;
		i++;
	}
}
function placeMarkerPL(location){
	if(typeof(markerPL) != 'undefined'){
		markerPL.setMap(null);
	}
	markerPL = new google.maps.Marker({position: location, map: mapPL,});
	var latitud = location.lat();
	var longitud = location.lng();
	var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
	document.getElementById('coorX').value = latitud;
	document.getElementById("coordX").innerHTML = latitud;
	document.getElementById('coorY').value = longitud;
	document.getElementById("coordY").innerHTML = longitud;
	$.getJSON(direccion, function(result){
		var address = result.results[0].formatted_address;
		document.getElementById('direccion').value = address;
		document.getElementById("dir").innerHTML = address;
	});
}
function mapaPuntoLimpio(){
	myCenterPL = new google.maps.LatLng(-33.0430962,-71.6184219);
	google.maps.event.addDomListener(window, 'load', initializePL);
}

function actualizarSlider(){
	document.getElementById("mostrarSlider").innerHTML = document.getElementById("slider").value+"%";
}

//Actualizar Punto Limpio
function initializeActu(){
	var mapProp = {center:myCenterActu, zoom:14, mapTypeId:google.maps.MapTypeId.ROADMAP};

	mapActu = new google.maps.Map(document.getElementById("googleMapActu"),mapProp);

	google.maps.event.addListener(mapActu, 'click', function(event){ selectMarkerActu(event.latLng); });

	var infowindows = [];
	var infowindow;
	var marcador;
	for(var i = 0; i < (PuntosLimpios.length); i++){
		console.log(PuntosLimpios[i]+" "+PuntosLimpios[i+1]);
		marcador = new google.maps.Marker({position: {lat: parseFloat(PuntosLimpios[i]), lng: parseFloat(PuntosLimpios[i+1])}, map: mapActu,});
		infowindow = new google.maps.InfoWindow({content:PuntosLimpios[i+2]});
		markerActu.push(marcador);
		infowindows.push(infowindow);
		google.maps.event.addListener(markerActu[parseInt(i/3)], 'click', function(k){
			return function(){
				for (var j = 0; j < infowindows.length; j++) {
					infowindows[j].close();
					markerActu[j].setAnimation(null);
				}
				markerActu[k].setAnimation(google.maps.Animation.BOUNCE);
				infowindows[k].open(mapActu, markerActu[k]);

				var latitud = markerActu[k].getPosition().lat();
				var longitud = markerActu[k].getPosition().lng();
				document.getElementById('coorX').value = latitud;
				document.getElementById("coordX").innerHTML = latitud;
				document.getElementById('coorY').value = longitud;
				document.getElementById("coordY").innerHTML = longitud;

				var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
				console.log(direccion);
				$.getJSON(direccion, function(result){
					var address = result.results[0].formatted_address;
					document.getElementById("dir").innerHTML = address;
				});
				
			}
		}(parseInt(i/3)));
		i++;
		i++;
	}

}
function selectMarkerActu(location){
	/*if(typeof(markerActu) != 'undefined'){
		markerActu.setMap(null);
	}*/
	//markerActu = new google.maps.Marker({position: location, map: mapActu,});
	/*var latitud = location.lat();
	var longitud = location.lng();
	var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";*/
	/*document.getElementById('coorX').value = latitud;
	document.getElementById("coordX").innerHTML = latitud;
	document.getElementById('coorY').value = longitud;
	document.getElementById("coordY").innerHTML = longitud;*/
	/*$.getJSON(direccion, function(result){*/
		/*var address = result.results[0].formatted_address;
		document.getElementById('direccion').value = address;
		document.getElementById("dir").innerHTML = address;*/
	/*});*/
}

function madeMap(locations){
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 12,
		center: new google.maps.LatLng(-33.0430962,-71.6184219),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	});

	var infowindow = new google.maps.InfoWindow();

	var marker, i;

	for (i = 0; i < locations.length; i++) {
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			map: map
		});

		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				infowindow.setContent(locations[i][0]);
				var nodeList = document.getElementsByName('rows');
				for (var j = 0; j < nodeList.length; j++) {
					nodeList[j].className="";
				}
				var row = document.getElementById(locations[i][3]);
				row.className="success";
				infowindow.open(map, marker);
			}
		})(marker, i));
	}
}

function mapaActualizar(){
	myCenterActu = new google.maps.LatLng(-33.0430962,-71.6184219);
	google.maps.event.addDomListener(window, 'load', initializeActu);

}

function resizeGoogleMap(idGoogle, idDiv){
	var ancho = document.getElementById(idDiv).offsetWidth - 30;
	document.getElementById(idGoogle).style.width = ancho;
}

//Solicitar Junta Vecinos
function initializeSoli(){
	var mapProp = {center:myCenterSoli, zoom:14, mapTypeId:google.maps.MapTypeId.ROADMAP};

	mapSoli = new google.maps.Map(document.getElementById("googleMapSoli"),mapProp);

	google.maps.event.addListener(mapSoli, 'click', function(event){ placeMarkerSoli(event.latLng); });
}
function placeMarkerSoli(location){
	if(typeof(markerSoli) != 'undefined'){
		markerSoli.setMap(null);
	}
	markerSoli = new google.maps.Marker({position: location, map: mapSoli,});
	var latitud = location.lat();
	var longitud = location.lng();
	var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
	document.getElementById('coorX').value = latitud;
	document.getElementById("coordX").innerHTML = latitud;
	document.getElementById('coorY').value = longitud;
	document.getElementById("coordY").innerHTML = longitud;
	console.log(direccion);
	$.getJSON(direccion, function(result){
		var address = result.results[0].formatted_address;
		document.getElementById('direccion').value = address;
		document.getElementById("dir").innerHTML = address;
		console.log(address);
	});
}
function mapaSolicitud(){
	myCenterSoli = new google.maps.LatLng(-33.0430962,-71.6184219);
	google.maps.event.addDomListener(window, 'load', initializeSoli);
}

//Ver solicitudes juntas vecinos
function initializeVer(){
	var mapProp = {center:myCenterVer, zoom:14, mapTypeId:google.maps.MapTypeId.ROADMAP};

	mapVer = new google.maps.Map(document.getElementById("googleMapVer"),mapProp);

	google.maps.event.addListener(mapVer, 'click', function(event){ placeMarkerVer(event.latLng); });

	var marcador;
	var infowindows = [];
	var markerActu = [];
	for(var i = 0; i < (PuntosLimpios.length); i++){
		console.log(PuntosLimpios[i]+" "+PuntosLimpios[i+1]);
		marcador = new google.maps.Marker({position: {lat: parseFloat(PuntosLimpios[i]), lng: parseFloat(PuntosLimpios[i+1])}, map: mapVer,});
		infowindow = new google.maps.InfoWindow({content:PuntosLimpios[i+2]});
		markerActu.push(marcador);
		infowindows.push(infowindow);
		google.maps.event.addListener(markerActu[parseInt(i/3)], 'click', function(k){
			return function(){
				for (var j = 0; j < infowindows.length; j++) {
					infowindows[j].close();
					markerActu[j].setAnimation(null);
				}
				markerActu[k].setAnimation(google.maps.Animation.BOUNCE);
				infowindows[k].open(mapVer, markerActu[k]);

				var latitud = markerActu[k].getPosition().lat();
				var longitud = markerActu[k].getPosition().lng();
				document.getElementById('coorX').value = latitud;
				document.getElementById("coordX").innerHTML = latitud;
				document.getElementById('coorY').value = longitud;
				document.getElementById("coordY").innerHTML = longitud;

				var direccion = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+latitud+","+longitud+"&sensor=true";
				console.log(direccion);
				$.getJSON(direccion, function(result){
					var address = result.results[0].formatted_address;
					document.getElementById("dir").innerHTML = address;
					document.getElementById("direccion").value = address;
				});
			}
		}(parseInt(i/3)));
		i++;
		i++;
	}

	var marcadorExistente;
	infowindowsExistente = [];
	markerActuExistente = [];
	for(var i = 0; i < (PuntosLimpiosExistente.length); i++){
		console.log(PuntosLimpiosExistente[i]+" "+PuntosLimpiosExistente[i+1]);
		marcadorExistente = new google.maps.Marker({position: {lat: parseFloat(PuntosLimpiosExistente[i]), lng: parseFloat(PuntosLimpiosExistente[i+1])}, map: mapVer,icon:"resources/pinkball.png",});		
		infowindowExistente = new google.maps.InfoWindow({content:PuntosLimpiosExistente[i+2]});
		marcadorExistente.setVisible(false);
		markerActuExistente.push(marcadorExistente);
		infowindowsExistente.push(infowindowExistente);
		google.maps.event.addListener(markerActuExistente[parseInt(i/3)], 'click', function(k){
			return function(){
				for (var j = 0; j < infowindowsExistente.length; j++) {
					infowindowsExistente[j].close();
				}
				infowindowsExistente[k].open(mapVer, markerActuExistente[k]);
			}
		}(parseInt(i/3)));
		i++;
		i++;
	}
}
function placeMarkerVer(location){
}
function mapaVerSoli(){
	myCenterVer = new google.maps.LatLng(-33.0430962,-71.6184219);
	google.maps.event.addDomListener(window, 'load', initializeVer);
}
function mostrarOcultarPLExistentes(){
	var estadoCheckbox = document.getElementById("MostrarPuntos").checked;
	for(var i = 0; i < markerActuExistente.length; i++){
		infowindowsExistente[i].close();
		markerActuExistente[i].setVisible(estadoCheckbox);
	}
}
