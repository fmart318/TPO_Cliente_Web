<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Cargas | TPO AD </title>
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
		$('#CargasTableContainer').jtable({
			title : 'Lista de Cargas',
			actions : {
				listAction : 'CrudCarga?action=list',
				createAction : 'CrudCarga?action=create',
				updateAction : 'CrudCarga?action=update',
				deleteAction : 'CrudCarga?action=delete'
			},
			fields : {
				idCarga : {
					title : 'id',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				peso : {
					title : 'Peso',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="peso" style="width:200px" value="' + data.record.peso + '" />';
						} else {
							return '<input type="text" name="peso" style="width:200px" value="4000" />';
						}
					}
					
				},
				ancho : {
					title : 'Ancho',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="ancho" style="width:200px" value="' + data.record.ancho + '" />';
						} else {
							return '<input type="text" name="ancho" style="width:200px" value="3" />';
						}
					}
				},
				alto : {
					title : 'Alto',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="alto" style="width:200px" value="' + data.record.alto + '" />';
						} else {
							return '<input type="text" name="alto" style="width:200px" value="2" />';
						}
					}
				},
				profundidad : {
					title : 'Profundidad',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="profundidad" style="width:200px" value="' + data.record.profundidad + '" />';
						} else {
							return '<input type="text" name="profundidad" style="width:200px" value="10" />';
						}
					}
				},
				volumen : {
					title : 'Volumen',
					width : '5%',
					edit : true,
					create: false,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="volumen" style="width:200px" value="' + data.record.volumen + '" />';
						} else {
							return '<input type="text" name="volumen" style="width:200px" value="60" />';
						}
					}
				},
				fragilidad : {
					title : 'Fragilidad',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="fragilidad" style="width:200px" value="' + data.record.fragilidad + '" />';
						} else {
							return '<input type="text" name="fragilidad" style="width:200px" value="Normal" />';
						}
					}
				},
				tratamiento : {
					title : 'Tratamiento',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tratamiento" style="width:200px" value="' + data.record.tratamiento + '" />';
						} else {
							return '<input type="text" name="tratamiento" style="width:200px" value="Normal" />';
						}
					}
				},
				apilable : {
					title : 'Apilable',
					width : '2%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="apilable" style="width:200px" value="' + data.record.apilable + '" />';
						} else {
							return '<input type="text" name="apilable" style="width:200px" value="2" />';
						}
					}
				},
				refrigerable : {
					title : 'Refrigerable',
					width : '5%',
					input : function(data) {
						if (data.record) {
							return '<input name="refrigerable" style="width:200px" type="checkbox" value="' + data.record.refrigerable + '">';
						} else {
							return '<input name="refrigerable" style="width:200px" value="false" type="checkbox">';
						}
					},
					
					display: function (data) {
			            if (data.record.refrigerable == true)
			            {
			                return '<input type="checkbox" checked>';
			            }
			            else
			            {
			                return '<input type="checkbox">';
			            }
				    },
					create: true,
					edit: true
				},
				condiciones : {
					title : 'Condiciones',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="condiciones" style="width:200px" value="' + data.record.condiciones + '" />';
						} else {
							return '<input type="text" name="condiciones" style="width:200px" value="Producto Cosmético" />';
						}
					}
				},
				despachado : {
					title : 'Despachado',
					width : '5%',
					edit : true,
					list: true,
					create: false,
					input : function(data) {
						if (data.record) {
							return '<input name="despachado" style="width:200px" type="checkbox" value="' + data.record.despachado + '">';
						} else {
							return '<input name="despachado" style="width:200px" value="false" type="checkbox">';
						}
					},
					display: function (data) {
			            if (data.record.despachado==true)
			            {
			                return '<input type="checkbox" checked>';
			            }
			            else
			            {
			                return '<input type="checkbox">';
			            }
				    },
					create: true,
					edit: true
				},
				tipoMercaderia : {
					title : 'Tipo de Mercadería',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tipoMercaderia" style="width:200px" value="' + data.record.tipoMercaderia + '" />';
						} else {
							return '<input type="text" name="tipoMercaderia" style="width:200px" value="Producto Cosmético" />';
						}
					}
				}
			}
		});
		$('#CargasTableContainer').jtable('load');
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

								<div id="CargasTableContainer" class="table"></div>
							</div>
						</div>

						<div class="fix"></div>
					</div>
				</div>
			</div>

			<div class="fix"></div>
		</div>

</body>
</html>