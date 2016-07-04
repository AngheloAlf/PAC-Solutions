<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseHome">Home</a>
						</div>
						<div id="collapseHome" class="panel-collapse in">
							<div class="panel-body">
								<h2><p style="text-align: center;">Bienvenido a <i>Prototipo</i></p></h2>
								<p style="text-align: center;">Desplácese por el navegador superior.</p>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</body>
</html>
