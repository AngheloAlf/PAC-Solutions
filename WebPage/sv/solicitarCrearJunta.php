<?php
if(isset($_POST["coorX"]) && isset($_POST["coorY"]) && isset($_POST["nombreJunta"]) && isset($_POST["direccion"]) && isset($_POST["telefono"]) && isset($_POST["nombre"]) && isset($_POST["email"]) && $_POST["coorX"] && $_POST["coorY"] && $_POST["nombreJunta"] && $_POST["direccion"] && $_POST["telefono"] && $_POST["nombre"] && $_POST["email"]){
	$error = false;
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorX"])){
		$error = true;
		jsAlert("Error coordenada X");
	}
	if(!preg_match("/^-?[0-9]+[.][0-9]+$/", $_POST["coorY"])){
		$error = true;
		jsAlert("Error coordenada Y");
	}
	if(!preg_match("/^[a-zA-Z0-9\-\_\.\s°#]+$/", $_POST["nombreJunta"])){
		$error = true;
		jsAlert("Ha ingresado caracteres invalidos.");
	}
	if(!preg_match("/^\+?[0-9]{7,12}$/", $_POST["telefono"])){
		$error = true;
		jsAlert("Ingrese un numero de telefono valido.");
	}
	if(!preg_match("/^[a-zA-ZñÑ\s.-_]+$/", $_POST["nombre"])){
		$error = true;
		jsAlert("Ha ingresado caracteres invalidos en su nombre.");
	}
	if(!preg_match("/^[a-zA-Z0-9.-_]+@[a-zA-Z0-9.-_]+\.[a-zA-Z0-9]+$/", $_POST["email"])){
		$error = true;
		jsAlert("Ingrese un mail valido.");
	}
	if(!$error){
		require "loginData.php";
		$dbconn = new mysqli($SQLhost, $SQLusuario, $SQLpass, $SQLname);
		if(mysqli_connect_error()){
			jsAlert("Ha ocurrido un problema al conectar la base de datos. Intentelo mas tarde.");
		}
		else{
			$sql = "SELECT id_soli FROM solicitud_juntas_vecinos WHERE (posx = '{$_POST["coorX"]}' AND posy = '{$_POST["coorY"]}') OR nombre = '{$_POST["nombreJunta"]}'";
			if($check = $dbconn->query($sql)){
				if($check->num_rows){
					jsAlert("Ya existe una solicitud de esta junta de vecinos.");
				}
				else{
					$fecha = obtenerFechaHora();
					$sql = "INSERT INTO solicitud_juntas_vecinos(nombre, direccion, posx, posy, fecha, nombre_contacto, telefono, email) VALUES ('{$_POST["nombreJunta"]}', '{$_POST["direccion"]}', '{$_POST["coorX"]}', '{$_POST["coorY"]}', '{$fecha}', '{$_POST["nombre"]}','{$_POST["telefono"]}', '{$_POST["email"]}')";
					if($dbconn->query($sql)){
						jsAlert("Datos añadidos satisfactoriamente.");
					}
					else{
						jsAlert($dbconn->error);
						jsAlert("Ha ocurrido un error al ingresar los datos a la base de datos.");
					}
				}
			}
			else{
				//jsAlert($dbconn->error);
				jsAlert("Ha ocurrido un error al acceder a la base de datos.");
			}
			/*$sql = "INSERT INTO puntos_limpios(direccion, tipo, estado, posx, posy) VALUES ('{$_POST["direccion"]}', '{$_POST["tipoPL"]}', '0', '{$_POST["coorX"]}', '{$_POST["coorY"]}')";
			$check = $dbconn->query($sql);
			if($check){
				jsAlert("Datos añadidos satisfactoriamente.");
			}
			else{
				jsAlert("Ha ocurrido un error al intentar agregar los datos.");
			}*/
		}
	}
}
else{
	jsAlert("Rellene todos los campos.");
}
redireccionarA("?page=home");
?>