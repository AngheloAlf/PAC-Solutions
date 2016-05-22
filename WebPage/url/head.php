<?php

require "sv/common.php";
require "sv/mdetect.php";

$uagent_obj = new uagent_info();

if(!isset($_SESSION["logeado"])){
	$_SESSION["logeado"] = false;
}

require "sv/getJS.php";

?>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/w3.css" rel="stylesheet">
	<link href="css/common.css" rel="stylesheet">
	<?php
	if($_SESSION["js"]){
		?>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/common.js"></script>
		<?php
	}
	?>
	<title>Arufu Creations</title>

</head>

<?php
autoRedirect('head.php', 'index.php');
?>
