<?php

function puntosLimpios($param){
  require ("config.php");
  if ($param["tipo"] == "estado") {
    $principalQuery="SELECT * FROM
                          	(SELECT  id_estado
                                     ,puntos_limpios_id
                                     ,vaciado
                                     ,estado
                                     ,fecha
                                FROM
                                   (
                                    SELECT  @row_num := IF(@prev_value=e.puntos_limpios_id,@row_num+1,1) AS RowNumber
                                           ,e.id_estado
                                           ,e.puntos_limpios_id
                                           ,e.vaciado
                                           ,e.estado
                                           ,e.fecha
                                           ,@prev_value := e.puntos_limpios_id
                                      FROM estados_puntos_limpios e,
                                           (SELECT @row_num := 1) x,
                                           (SELECT @prev_value := '') y
                                     ORDER BY e.puntos_limpios_id, e.fecha DESC
                                   ) subsubquery
                               WHERE RowNumber = 1) subquery
                          INNER JOIN puntos_limpios ON puntos_limpios.id=subquery.puntos_limpios_id";
    if($param["criterio"] == "up"){
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
