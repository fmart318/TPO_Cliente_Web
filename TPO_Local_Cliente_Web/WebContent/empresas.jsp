<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Empresas | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>



<script type="text/javascript">
	$(document).ready(function() {
		$('#EmpresaTableContainer').jtable({
			title : 'Lista de Clientes Empresas',
			
			actions : {
				listAction : 'CrudClienteEmpresa?action=list',
				createAction : 'CrudClienteEmpresa?action=create',
				updateAction : 'CrudClienteEmpresa?action=update',
				deleteAction : 'CrudClienteEmpresa?action=delete'
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
							return '<input type="text" name="nombre" style="width:200px" value="Cruz Del Sur SRL" />';
						}
					}
				},
				CUIT : {
					title : 'CUIT',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="CUIT" style="width:200px" value="' + data.record.CUIT + '" />';
						} else {
							return '<input type="text" name="CUIT" style="width:200px" value="34028" />';
						}
					}
				},
				tipo : {
					title : 'Tipo',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tipo" style="width:200px" value="' + data.record.tipo + '" />';
						} else {
							return '<input type="text" name="tipo" style="width:200px" value="Inscripto" />';
						}
					}
				},
				detallePoliticas : {
					title : 'Detalle Pol�ticas',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="detallePoliticas" style="width:200px" value="' + data.record.detallePoliticas + '" />';
						} else {
							return '<input type="text" name="detallePoliticas" style="width:200px" value="Pol�tica 1283" />';
						}
					}
				},
				saldoCuentaCorriente : {
					title : 'Saldo CC',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="saldoCuentaCorriente" style="width:200px" value="' + data.record.saldoCuentaCorriente + '" />';
						} else {
							return '<input type="text" name="saldoCuentaCorriente" style="width:200px" value="2400" />';
						}
					}
				}
			}
		});
		$('#EmpresaTableContainer').jtable('load');
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
								<div id="EmpresaTableContainer" class="table"></div>
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