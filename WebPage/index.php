<?php

require ("sv/configPage.php");
include ('url/head.php');

if(isset($_GET['wip']) && !empty($_GET['wip'])){
	require ('url/wipPage.php');
}
elseif(isset($_GET['page']) && !empty($_GET['page'])){
	$pagina = 'url/'.$_GET['page'].'.php';
	if(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.php');
	}
}
elseif(isset($_GET["s"]) && !empty($_GET['s'])){
	$pagina = 'sv/'.$_GET['s'].'.php';
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

