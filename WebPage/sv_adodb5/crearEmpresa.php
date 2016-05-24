<?php
//NO FUNCIONA POR ERROR EN LAS TABLAS
require "config.php";
$db = newAdoConnection($driver);
$db->connect($SQLhost,$SQLusuario,$SQLpass,$SQLname);
if($db->isConnected()){
  $query="INSERT INTO empresas (nombre,telefono,direccion,posx,posy,tipo) VALUES ('{$_POST["nombre"]}','{$_POST["nroContacto"]}','{$_POST["direccion"]}','{$_POST["coorX"]}','{$_POST["coorY"]}','{$_POST["tipo"]}')";
  $db->execute($query);
  jsAlert("Empresa Añadida");
  header('Location: admin_index.php?page=dashboard');
}
else {
  jsAlert("Error de conexion con el servidor, intentelo mas tarde");
  redireccionarA("?page=home");
}
?>
