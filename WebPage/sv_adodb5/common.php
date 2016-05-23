<?php

function puntosLimpios($param){
  require ("config.php");
  if ($param["tipo"] == "estado") {
    if($param["criterio"] == "up"){
      $query = "SELECT * FROM puntos_limpios WHERE estado>='{$param["valor"]}'";
    }
    else {
      $query = "SELECT * FROM puntos_limpios WHERE estado<='{$param["valor"]}'";
    }
  }
  $db = newAdoConnection($driver);
  $db->connect($SQLhost,$SQLusuario,$SQLpass,$SQLname);
  return $db->getAll($query);
}
?>
