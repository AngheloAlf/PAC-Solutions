<br>
<?php
if(isset($_SESSION["logeado"]) && $_SESSION["logeado"]){
	?>
	<form style="text-align: center;" action="?page=deslogear" method="post">
		<button class="btn btn-primary">Desconexión</button>
	</form>
	<?php
}
?>
<br>
<footer class="footer text-center" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 70%;padding: 10px;"';} ?> >
	<div class="row-fluid">
		<div class="panel w3-topnav w3-blue">
			<div class="panel-heading">
				<div class="text-right"><i>Created by PAC Solutions</i></div>
			</div>
		</div>
	</div>
</footer>
