<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Vehículos | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src=./scripts/popup.js type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#VehiculosTableContainer').jtable({
			title : 'Lista de Vehículos',
			actions : {
				listAction : 'CrudVehiculo?action=list',
				createAction : 'CrudVehiculo?action=create',
				updateAction : 'CrudVehiculo?action=update',
				deleteAction : 'CrudVehiculo?action=delete'
			},
			fields : {
				idVehiculo : {
					title : 'id',
					width : '1%',
					key : true,
					list : true,
					edit : false,
					create : false
				},
				tipo : {
					title : 'Tipo',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tipo" style="width:200px" value="' + data.record.tipo + '" />';
						} else {
							return '<input type="text" name="tipo" style="width:200px" value="Camion" />';
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
				tara : {
					title : 'Tara',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="tara" style="width:200px" value="' + data.record.tara + '" />';
						} else {
							return '<input type="text" name="tara" style="width:200px" value="800" />';
						}
					}
				},
				kilometraje : {
					title : 'Kilometraje',
					width : '5%',
					edit : true,
					input : function(data) {
						if (data.record) {
							return '<input type="text" name="kilometraje" style="width:200px" value="' + data.record.kilometraje + '" />';
						} else {
							return '<input type="text" name="kilometraje" style="width:200px" value="5000" />';
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
				trabajoEspecifico : {
					title : 'Trabajo Específico',
					width : '5%',
					input : function(data) {
						if (data.record) {
							return '<input name="trabajoEspecifico" style="width:200px" type="checkbox" value="' + data.record.trabajoEspecifico + '">';
						} else {
							return '<input name="trabajoEspecifico" style="width:200px" value="false" type="checkbox">';
						}
					},
					display: function (data) {
			            if (data.record.trabajoEspecifico)
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
				enGarantia : {
					title : 'En Garantia/Epsecificación',
					width : '2%',
					input : function(data) {
						if (data.record) {
							return '<input name="enGarantia" style="width:200px" type="checkbox" value="' + data.record.enGarantia + '">';
						} else {
							return '<input name="enGarantia" style="width:200px" value="true" type="checkbox">';
						}
					},
					display: function (data) {
			            if (data.record.enGarantia)
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
				fechaUltimoControl : {
					title : 'Fecha Ultima Control',
					width : '5%',
					list: true,
					edit : true,
					type : 'date',
					displayFormat : 'yy-mm-dd'
				},
				idPlanDeMantenimiento : {
					title : 'idPlanDeMantenimiento',
					width : '1%',
					list: true,
					edit : true,
					display:function(data){
						if(data.record.planDeMantenimiento)
                            return $('<a href="verPlanDeMantenimiento.jsp?idPlanDeMantenimiento=' +data.record.planDeMantenimiento.idPlanDeMantenimiento+'"onClick="return popup(this)">'+data.record.planDeMantenimiento.idPlanDeMantenimiento+'</a>');
		        	}
				}
			}
		});
		$("fechaUltimoControl").datepicker();
		$('#VehiculosTableContainer').jtable('load');
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
								<div id="VehiculosTableContainer" class="table"></div>
							</div>
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