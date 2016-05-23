<?php
  $_SESSION["params"] = array("tipo"=>$_POST["tipo"],"criterio"=>$_POST["criterio"],"valor"=>$_POST["slider"]);
  header ("Location: ?page=listaPuntos");
?>
