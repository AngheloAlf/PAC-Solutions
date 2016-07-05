<?php
//NO FUNCIONA POR ERROR EN LAS TABLAS
require "config.php";
$db = newAdoConnection($driver);
$db->connect($SQLhost,$SQLusuario,$SQLpass,$SQLname);
if($db->isConnected()){
  if($_POST["descrip"]==""){
    $query="INSERT INTO recicladores (nombre,correo,contacto,password,direccion,posx,posy) VALUES ('{$_POST["nombre"]}','{$_POST["correo"]}','{$_POST["contacto"]}','{$_POST["password"]}','{$_POST["direccion"]}','{$_POST["coorX"]}','{$_POST["coorY"]}')";
  }
  else {
    $query="INSERT INTO recicladores (nombre,correo,contacto,password,direccion,descripcion,posx,posy) VALUES ('{$_POST["nombre"]}','{$_POST["correo"]}','{$_POST["contacto"]}','{$_POST["password"]}','{$_POST["direccion"]}','{$_POST["descrip"]}','{$_POST["coorX"]}','{$_POST["coorY"]}')";
  }
  $db->execute($query);
  jsAlert("Recolector Añadido");
  header('Location: admin_index.php?page=dashboard');
}
else {
  jsAlert("Error de conexion con el servidor, intentelo mas tarde");
  redireccionarA("?page=home");
}
?>
