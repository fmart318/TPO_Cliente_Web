<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vehiculos A Mantener | TPO AD </title>
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
		$('#VehiculosAMantener').jtable({
			title : 'Vehiculos a Enviar a Mantenimiento',
			
			actions : {
				listAction : 'CrudVehiculosAMantener?action=list'
			},
			
			fields : {
				idVehiculo : {
					title : 'Vehiculo',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				hayQueMantener : {
					title : 'Necesita Mantenimiento',
					width : '10%',
					edit : false
				},
				tipoDeTrabajo : {
					title : 'Tipo de Trabajo',
					edit : false
				},
				puntoAControlar : {
					title : 'Punto a Controlar',
					edit : false
				},
				tareas : {
					title: 'Tareas a Realizar',
					edit: false
				},
				estado : {
					title : "Estado",
					edit : true
				},
				mantener : {
					title : "",
					display : function() {
						 return '<button type="button" onClick="actualizarEstado()">Enviar a Mantenimiento</button>'
					}
				}
			}
		});
		$('#VehiculosAMantener').jtable('load');
	});
	
	function actualizarEstado() {
		
		Administrador.getInstance().actualizarEstadoVehiculo();
	}

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
								<div id="VehiculosAMantener" class="table"></div>
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