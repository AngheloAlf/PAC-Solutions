<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style=";padding:0px 15% 0px 15%"';} ?> >
	<div class="row-fluid">
		<div class="col-md-12">
			<div class="panel panel-primary" id="easter_egg" <?php if($_SESSION["js"]){ echo 'onmouseout="easter_eggColor()" onmouseover="easter_eggImage()"';} if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 10px;"'; } ?>>
				<div class="panel-body" style="text-align:center">
					<i id="easter_egg2">La pagina se encuentra en desarrollo.</i>
				</div>
			</div>
			<br>
		</div>
		<br>
	</div>
</div>
