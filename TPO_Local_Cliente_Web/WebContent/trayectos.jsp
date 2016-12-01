<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Trayectos | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#TrayectosTableContainer').jtable({
			title : 'Lista de Trayectos',
			actions : {
				listAction : 'CrudTrayecto?action=list',
				createAction : 'CrudTrayecto?action=create',
				updateAction : 'CrudTrayecto?action=update',
				deleteAction : 'CrudTrayecto?action=delete'
			},
			fields : {
				idTrayecto : {
					title : 'id',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				tiempo : {
					title : 'Tiempo',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tiempo" style="width:200px" value="' + data.record.tiempo + '" />';
						} else {
							return '<input type="text" name="tiempo" style="width:200px" value="4" />';
						}
					}
				},
				km : {
					title : 'Kilómetro',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="km" style="width:200px" value="' + data.record.km + '" />';
						} else {
							return '<input type="text" name="km" style="width:200px" value="40" />';
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
							return '<input type="text" name="precio" style="width:200px" value="400" />';
						}
					}
				},
				idSucursalOrigen : {
					title : 'idSucursalOrigen',
					width : '5%',
					edit : true,
					display:function(data){
						if(data.record)
	                        return $('<a href="verSucursal.jsp?idSucursal=' +data.record.idSucursalDestino+'"onClick="return popup(this)">'+data.record.idSucursalDestino+'</a>');
		        	}
				},
				idSucursalDestino : {
					title : 'idSucursalDestino',
					width : '5%',
					edit : true,
					display:function(data){
						if(data.record)
	                        return $('<a href="verRuta.jsp?idRuta=' +data.record.idSucursalDestino+'"onClick="return popup(this)">'+data.record.idSucursalDestino+'</a>');
		        	}
				}/* ,
				
				idRuta : {
					title : 'idRuta',
					width : '5%',
					edit : true,
					display:function(data){
						if(data.record.ruta)
	                        return $('<a href="verRuta.jsp?idRuta=' +data.record.ruta.idRuta+'"onClick="return popup(this)">'+data.record.ruta.idRuta+'</a>');
		        	}
				} */
			}
		});
		$('#TrayectosTableContainer').jtable('load');
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
								<div id="TrayectosTableContainer" class="table"></div>
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