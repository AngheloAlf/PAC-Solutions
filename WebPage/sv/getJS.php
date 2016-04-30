<?php
if(!isset($_SESSION["js"])){
	$_SESSION["js"] = true;
	$_SESSION["togglejs"] = true;
	$redireccionar = "home";
	if(isset($_GET["url"])){
		$redireccionar = $_GET["url"];
	}
	?>
	<noscript>
		<meta http-equiv="refresh" content="0;URL=?s=noJS&redireccionar=<?php echo $redireccionar; ?>" />
	</noscript>
	<?php
}
else{
	if(isset($_GET["redireccionar"])){
		$redireccionar = $_GET["redireccionar"];
	}
	else{
		$redireccionar = "home";
		if(isset($_GET["url"])){
			$redireccionar = $_GET["url"];
		}
	}
	if(!$_SESSION["togglejs"]){
		?>
		<script type="text/javascript">
			window.location = "?s=siJS&redireccionar=<?php echo $redireccionar; ?>"
		</script>
		<?php
	}
	else{
		?>
		<noscript>
			<meta http-equiv="refresh" content="0;URL=?s=noJS&redireccionar=<?php echo $redireccionar; ?>" />
		</noscript>
		<?php
	}
}
?>
