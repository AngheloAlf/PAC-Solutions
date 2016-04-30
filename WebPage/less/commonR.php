<?php

function redireccionarAR($Pagina){
	echo '<html><meta http-equiv="refresh" content="0;URL='.$Pagina.'" /></html>';
}

function autoRedirectR($nombreActual, $haciaDonde){
	$urlActual = explode("/",$_SERVER["REQUEST_URI"]);
	$urlActual = explode(".", end($urlActual));
	$urlActual = $urlActual[0].".php";
	if(($urlActual == $nombreActual.'.php') || ($urlActual == $nombreActual)){
		redireccionarAR($haciaDonde);
	}
}
?>
