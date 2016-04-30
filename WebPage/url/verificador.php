<?php
$rutDV = "";
$DV = "";
if(llaveEnArreglo('rutDV', $_POST)){
	$rutDV = $_POST["rutDV"];
	$DV = digitoVerificador($rutDV);
}
?>

<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseDV">Generador de digito verificador</a>
						</div>
						<div id="collapseDV" class="panel-collapse in">
							<div class="panel-body">
								<?php
								if(!$_SESSION["js"]){
									echo '<form action="" method="post">';
								}
								?>
									<label>Ingrese su rut sin guion:</label>
									<input type="text" class="form-control" id="rutDV" name="rutDV" value="<?php echo $rutDV; ?>" />
									<br>
									<button <?php if($_SESSION["js"]){ echo 'onclick="generarDV()"';} ?> class="btn btn-primary">Generar</button>
									<br>
									<center><p id="DV"><?php if($rutDV){echo "<br>Su rut con digito verificador es $rutDV-$DV";} ?></p></center>
								<?php
								if(!$_SESSION["js"]){
									echo '</form>';
								}
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
