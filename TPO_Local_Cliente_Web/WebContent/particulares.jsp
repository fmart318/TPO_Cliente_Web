<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Particulares | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src=./scripts/popup.js type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#ParticularTableContainer').jtable({
			title : 'Lista de Clientes Particulares',
			actions : {
				listAction : 'CrudClienteParticular?action=list',
				createAction : 'CrudClienteParticular?action=create',
				updateAction : 'CrudClienteParticular?action=update',
				deleteAction : 'CrudClienteParticular?action=delete'
			},
			fields : {
				idCliente : {
					title : 'id',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				nombre : {
					title : 'Nombre',
					width : '10%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="nombre" style="width:200px" value="' + data.record.nombre + '" />';
						} else {
							return '<input type="text" name="nombre" style="width:200px" value="Eugenia" />';
						}
					}
				},
				DNI : {
					title : 'DNI',
					width : '10%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="DNI" style="width:200px" value="' + data.record.DNI + '" />';
						} else {
							return '<input type="text" name="DNI" style="width:200px" value="12345678" />';
						}
					}
				},
				apellido : {
					title : 'Apellido',
					width : '10%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="apellido" style="width:200px" value="' + data.record.apellido + '" />';
						} else {
							return '<input type="text" name="apellido" style="width:200px" value="Rios" />';
						}
					}
				}
			}
		});
		$('#ParticularTableContainer').jtable('load');
	});
</script>

</head>
<body>
<div id="wrapper">

		<div id="header">
			<div class="col-full">
				<h1>TPO AD</h1>
			</div>
		</div>

		<div id="content-wrap">
			<div id="navigation" class="col-full">
				<ul id="main-nav" class="nav fl">
					<li><a href="index.jsp">Inicio</a></li>
					<li><a href="vehiculosTerceros.jsp">Vehiculos Terceros</a></li>
					<li><a href="direcciones.jsp">Direcciones</a></li>
					<li><a href="empresas.jsp">Empresas</a></li>
					<li><a href="particulares.jsp">Particulares</a></li>
					<li><a href="planesDeMantenimiento.jsp">Mantenimientos</a></li>
					<li><a href="vehiculos.jsp">Veh�culos</a></li>
					<li><a href="vehiculosAMantener.jsp">Veh�culos A Mantener</a></li>
					<li><a href="cargas.jsp">Cargas</a></li>
					<li><a href="sucursales.jsp">Sucursales</a></li>
					<li><a href="rutas.jsp">Rutas</a></li>
					<li><a href="trayectos.jsp">Trayectos</a></li>
					<li><a href="pedidos.jsp">Pedidos</a></li>
					<li><a href="remitos.jsp">Remitos</a></li>
					<li><a href="envios.jsp">Env�os</a></li>				
					<li><a href="facturas.jsp">Facturas</a></li>
				</ul>
			</div>
			<div class="featured col-full feat-blog">
				<div class="feat-post">
					<div class="feat-content">
	
						<div class="entry">
								<div id="ParticularTableContainer" class="table"></div>
						</div>

						<div class="fix"></div>
					</div>
				</div>
			</div>

			<div class="fix"></div>
		</div>
</div>
</body>
</html>