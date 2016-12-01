<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vehiculos Terceros | TPO AD</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src="scripts/popup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#VTerceroTableContainer').jtable({
			title : 'Lista de Vehiculos Terceros',
			actions : {
				listAction : 'CrudVTercero?action=list',
				createAction : 'CrudVTercero?action=create',
				updateAction : 'CrudVTercero?action=update',
				deleteAction : 'CrudVTercero?action=delete'
			},
			fields : {
				idVehiculoTercero : {
					title : 'id',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				tipoVehiculo : {
					title : 'Tipo',
					width : '10%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tipoVehiculo" style="width:200px" value="' + data.record.tipoVehiculo + '" />';
						} else {
							return '<input type="text" name="tipoVehiculo" style="width:200px" value="Camioneta" />';
						}
					}
				},
				precio : {
					title : 'Precio',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="precio" style="width:200px" value="' + data.record.precio + '" />';
						} else {
							return '<input type="text" name="precio" style="width:200px" value="1500" />';
						}
					}
				},
				estado : {
					title : 'Estado',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="estado" style="width:200px" value="' + data.record.estado + '" />';
						} else {
							return '<input type="text" name="estado" style="width:200px" value="Libre" />';
						}
					}
				},
				fechaLlegada  : {
					title : 'Fecha Llegada',
					width : '5%',
					edit : true,
					create : true,
					type : 'date',
					displayFormat : 'yy-mm-dd'
					
				},
				verPedido  : {
					title : 'Pedidos',
					width : '5%',
					list: true,
					create: false,
					edit: false,
					display:function(data){
						if(data.record)
                            return $('<a href="verPedidos.jsp?idVehiculoTercero=' +data.record.idVehiculoTercero+'"onClick="return popup(this)">Pedidos</a>');
		        	}
				}

				
			}
		});
		$("#fechaLlegada").datepicker();
		$('#VTerceroTableContainer').jtable('load');
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
					<li><a href="vehiculos.jsp">Vehículos</a></li>
					<li><a href="vehiculosAMantener.jsp">Vehículos A Mantener</a></li>
					<li><a href="cargas.jsp">Cargas</a></li>
					<li><a href="sucursales.jsp">Sucursales</a></li>
					<li><a href="rutas.jsp">Rutas</a></li>
					<li><a href="trayectos.jsp">Trayectos</a></li>
					<li><a href="pedidos.jsp">Pedidos</a></li>
					<li><a href="remitos.jsp">Remitos</a></li>
					<li><a href="envios.jsp">Envíos</a></li>				
					<li><a href="facturas.jsp">Facturas</a></li>
				</ul>
			</div>

			<div class="featured col-full feat-blog">
				<div class="feat-post">
					<div class="feat-content">

						<div class="entry">
							<div id="VTerceroTableContainer" class="table"></div>
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