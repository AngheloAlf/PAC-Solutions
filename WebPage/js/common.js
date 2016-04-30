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
