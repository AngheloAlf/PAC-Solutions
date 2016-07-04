<?php
if(isset($_POST["tipoPL"]) && isset($_POST["coorX"]) && isset($_POST["coorY"]) && isset($_POST["direccion"]) && $_POST["tipoPL"] && $_POST["coorX"] && $_POST["coorY"] && $_POST["direccion"]){
	$error = false;
	if(!in_array($_POST["tipoPL"], array("Botellas", "Latas"))){
		$error = true;
		jsAlert("Tipo de punto limpio incorrecto");
	}
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorX"])){
		$error = true;
		jsAlert("Error coordenada X");
	}
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorY"])){
		$error = true;
		jsAlert("Error coordenada Y");
	}
	if(!preg_match("/^[a-zA-Z0-9, áéíóúÁÉÍÓÚñÑ-]+$/", $_POST["direccion"])){
		$error = true;
		jsAlert("Error de dirrecion");
	}
	if(!$error){
		require "config.php";
		$dbconn = new mysqli($SQLhost, $SQLusuario, $SQLpass, $SQLname);
		if(mysqli_connect_error()){
			jsAlert("Ha ocurrido un problema al conectar la base de datos. Intentelo mas tarde.");
		}
		else{
			$sql = "INSERT INTO puntos_limpios(direccion, tipo, estado_pl, posx, posy) VALUES ('{$_POST["direccion"]}', '{$_POST["tipoPL"]}', '0', '{$_POST["coorX"]}', '{$_POST["coorY"]}')";
			$check = $dbconn->query($sql);
			if($check){
				jsAlert("Datos añadidos satisfactoriamente.");
			}
			else{
				jsAlert("Ha ocurrido un error al intentar agregar los datos.");
			}
		}
	}
}
else{
	jsAlert("Rellene todos los campos.");
}
redireccionarA("?page=home");
?>
