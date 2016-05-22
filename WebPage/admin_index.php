<?php

require ("sv/configPage.php");
include ('admin_page/include/head.php');
include ('admin_page/include/header.php');
if(isset($_SESSION["user_admin"])){
	if(isset($_GET['wip']) && !empty($_GET['wip'])){
		require ('url/wipPage.php');
	}
	elseif(isset($_GET['page']) && !empty($_GET['page'])){
		$pagina = 'admin_page/'.$_GET['page'].'.php';
		if(file_exists($pagina)){
			require ($pagina);
		}
		else{
			require ('url/404.php');
		}
	}
	elseif(isset($_GET["s"]) && !empty($_GET['s'])){
		$pagina = 'sv_adodb5/'.$_GET['s'].'.php';
		if(file_exists($pagina)){
			require ($pagina);
		}
		else{
			require ('url/404.php');
		}
	}
}
else {
	header("Location: index.php");
}
include ('admin_page/include/footer.php');

?>
