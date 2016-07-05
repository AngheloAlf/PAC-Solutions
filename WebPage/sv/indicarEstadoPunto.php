<?php
if(isset($_POST["coorX"]) && isset($_POST["coorY"]) && isset($_POST["slider"]) && $_POST["coorX"] && $_POST["coorY"] && $_POST["slider"]){
	$error = false;
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorX"])){
		$error = true;
		jsAlert("Error coordenada X");
	}
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorY"])){
		$error = true;
		jsAlert("Error coordenada Y");
	}
	if(!preg_match("/^[0-9]{0,2}$/", $_POST["slider"]) && !preg_match("/^100$/", $_POST["slider"])){
		$error = true;
		jsAlert("Error de slider.");
	}
	if(!$error){
		require "loginData.php";
		$dbconn = new mysqli($SQLhost, $SQLusuario, $SQLpass, $SQLname);
		if(mysqli_connect_error()){
			jsAlert("Ha ocurrido un problema al conectar la base de datos. Intentelo mas tarde.");
		}
		else{
			$sql = "SELECT id from puntos_limpios WHERE posx = '{$_POST["coorX"]}' and posy = '{$_POST["coorY"]}'";
			if($check = $dbconn->query($sql)){
				$id = $check->fetch_row()[0];
				$fecha = obtenerFechaHora();
				$sql2 = "INSERT INTO estados_puntos_limpios(puntos_limpios_id, estado, fecha) VALUES ('{$id}', '{$_POST["slider"]}', '{$fecha}')";
				if($dbconn->query($sql2)){
					jsAlert("Datos añadidos satisfactoriamente.");
				}
				else{
					//jsAlert($dbconn->error);
					jsAlert("Ha ocurrido un error al ingresar los datos.");
				}
			}
			else{
				jsAlert("Ha ocurrido un error al acceder a los datos.");
			}
		}
	}
}
else{
	jsAlert("Rellene todos los campos.");
}
redireccionarA("?page=home");
?>