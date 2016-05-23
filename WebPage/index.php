<?php

require ("sv/configPage.php");
include ('url/head.php');
include ('url/header.php');

if(isset($_GET['wip']) && !empty($_GET['wip'])){
	require ('url/wipPage.php');
}
elseif(isset($_GET['page']) && !empty($_GET['page'])){
	if($_GET['page'] == "admin"){
		$pagina = 'admin_page/login.php';
	}
	else{
		$pagina = 'url/'.$_GET['page'].'.php';
	}
	if(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.php');
	}
}
elseif(isset($_GET["s"]) && !empty($_GET['s'])){
	if(($_GET['s'] == "login_handler") || ($_GET['s'] == "puntos_limpios_handler")){
		$pagina = 'sv_adodb5/handlers/'.$_GET['s'].'.php';
	}
	else{
		$pagina = 'sv/'.$_GET['s'].'.php';
	}
	if(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.php');
	}
}
else{
	require ('url/home.php');
}

include ('url/footer.php');

?>
