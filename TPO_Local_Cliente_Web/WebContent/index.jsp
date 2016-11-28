<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Inicio | TPO AD</title>
	<link href="./css/styles.css" rel="stylesheet" type="text/css" />
	<!-- Include one of jTable styles. -->
	<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
	<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<script src=./scripts/popup.js type="text/javascript"></script>
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
					<li><a href="precioVehiculos.jsp">V. Terceros</a></li>
					<li><a href="direcciones.jsp">Direcciones</a></li>
					<li><a href="proveedores.jsp">Proveedores</a></li>
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
						<div style="width: 100%; margin-right: 5%; margin-left: 5%;">
							<h2>
								<strong>Aplicaciones Distribuidas</strong>
							</h2>
							<br />
							<h2>
								<strong>TPO<strong>
							</h2>
							<br />
							<h3>
								<strong>Profesor:<strong>
							</h3>
							<ul>
								<li>Godio, Claudio Jose</li>
								<li>Tam, Juan Manuel</li>
							</ul>
							<br />
							<h3>Alumnos:</h3>
							<ul>
								<li>Martinez, Felipe , LU 1073152</li>
								<li>Mollo Apaza, Eleodoro , LU 107912</li>
								<li>Sansone, Yamila , LU 1019115</li>
							</ul>
							<br />
							<br />
							<h3>Tutorial de Envios:</h3>
							<br />
							<small>1. Cargar la base de datos con datos inciales:</small>
								<form action="./CargarDatosIniciales" method="post">
									<div class="form-actions">
											<input type="submit" value="Cargar Datos Iniciales" />
									</div>
								</form>
							<br />
							<small>2. Generar Nuevo Envio: (Apretar Controlar Estado de Envios una vez)</small>
							<br />
							<small>3. Controlar LLegada de Envio a Sucursal Intermediario:(Apretar Controlar Estado de Envios una vez)</small>
							<br />
							<small>4. Controlar LLegada de Envio a Sucursal Destino:(Apretar Controlar Estado de Envios una vez)</small>
							<br />
							<form action="./ControlarEstadoDeEnvios" method="post">
									<div class="form-actions">
											<input type="submit" value="Controlar Estado Envios" />
									</div>
							</form>
						</div>

						<div class="fix"></div>
					</div>
				</div>
			</div>

			<div class="fix"></div>
		</div>
	</div>
</div>
</body>
</html>