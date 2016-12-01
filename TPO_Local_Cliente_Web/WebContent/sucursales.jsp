<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sucursales | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src="scripts/popup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#SucursalTableContainer').jtable({
			title : 'Lista de Sucursales',
			actions : {
				listAction : 'CrudSucursal?action=list',
				createAction : 'CrudSucursal?action=create',
				updateAction : 'CrudSucursal?action=update',
				deleteAction : 'CrudSucursal?action=delete'
			},
			fields : {
				idSucursal : {
					title : 'idSucursal',
					width : '10%',
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
							return '<input type="text" name="nombre" style="width:200px" value="Sucursal Palermo" />';
						}
					}
				},
				idDireccion : {
					title : 'idDireccion',
					width : '10%',
					edit : true,
					create: true,
					display:function(data){
						if(data.record.direccion)
                            return $('<a href="verDireccion.jsp?idDireccion=' +data.record.direccion.idDireccion+'"onClick="return popup(this)">'+data.record.direccion.idDireccion+'</a>');
		        	},
		        	input: function (data) {
				        if (data.record) {
				            return '<input type="text" name="idDireccion" style="width:200px" value="' +data.record.direccion.idDireccion+ '" />';
				        } else {
				            return '<input type="text" name="idDireccion" style="width:200px" value="" />';
				        }
				    }
				},
				verPedido  : {
					title : 'Pedidos',
					width : '5%',
					list: true,
					create: false,
					edit: false,
					display:function(data){
						if(data.record)
                            return $('<a href="verPedido.jsp?idSucursal=' +data.record.idSucursal+'"onClick="return popup(this)">Pedidos</a>');
		        	}
				}
			}
		});
		$('#SucursalTableContainer').jtable('load');
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
					<li><a href="./pedidos">Pedidos</a></li>
					<li><a href="remitos.jsp">Remitos</a></li>
					<li><a href="envios.jsp">Envíos</a></li>				
					<li><a href="facturas.jsp">Facturas</a></li>
				</ul>
			</div>

			<div class="featured col-full feat-blog">
				<div class="feat-post">
					<div class="feat-content">
	
						<div class="entry">
								<div id="SucursalTableContainer" class="table"></div>
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