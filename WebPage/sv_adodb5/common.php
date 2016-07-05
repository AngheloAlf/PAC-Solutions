<?php

function puntosLimpios($param){
  require ("config.php");
  if ($param["tipo"] == "estado") {
    $Dia= new DateTime(date("Y-m-d")." 00:00:00");
    $principalQuery="SELECT  *
                    FROM
                       (
                        SELECT  @row_num := IF(@prev_value=o.id,@row_num+1,1) AS RowNumber
                               ,o.id
                               ,o.fecha
                               ,o.estado
                           	 ,o.direccion
                           	 ,o.tipo
                           	 ,o.posx
                           	 ,o.posy
                               ,@prev_value := o.id
                          FROM (SELECT id,AVG(estado) as estado,direccion,tipo,posx,posy,fecha FROM (SELECT * FROM `estados_puntos_limpios` WHERE vaciado=0) A INNER JOIN `puntos_limpios` B ON A.puntos_limpios_id=B.id GROUP BY DATE(fecha),id) o,
                               (SELECT @row_num := 1) x,
                               (SELECT @prev_value := '') y
                         ORDER BY o.id, o.fecha DESC
                       ) subquery
                   WHERE RowNumber = 1";
    if ($param["criterio"] == "up") {
      $query = $principalQuery." AND subquery.estado>='{$param["valor"]}'";
    }
    else {
      $query = $principalQuery." AND subquery.estado<='{$param["valor"]}'";
    }
  }
  $db = newAdoConnection($driver);
  $db->connect($SQLhost,$SQLusuario,$SQLpass,$SQLname);
  return $db->getAll($query);
}
?>
