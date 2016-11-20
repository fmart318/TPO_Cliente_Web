<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Viajes | TPO AD </title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src=scripts/popup.js type="text/javascript"></script>
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
					<li><a href="precioVehiculos.jsp">Precio de Vehículos</a></li>
					<li><a href="direcciones.jsp">Direcciones</a></li>
					<li><a href="proveedores.jsp">Proveedores</a></li>
					<li><a href="empresas.jsp">Empresas</a></li>
					<li><a href="particulares.jsp">Particulares</a></li>
					<li><a href="planesDeMantenimiento.jsp">Mantenimientos</a></li>
					<li><a href="vehiculos.jsp">Vehículos</a></li>
					<li><a href="cargas.jsp">Cargas</a></li>
					<li><a href="sucursales.jsp">Sucursales</a></li>
					<li><a href="rutas.jsp">Rutas</a></li>
					<li><a href="trayectos.jsp">Trayectos</a></li>
					<li><a href="./pedidos">Pedidos</a></li>
					<li><a href="remitos.jsp">Remitos</a></li>
					<li><a href="envios.jsp">Envíos</a></li>
					<li><a href="viajes.jsp">Viajes</a></li>					
					<li><a href="facturas.jsp">Facturas</a></li>
				</ul>
			</div>

			<div class="featured col-full feat-blog">
				<div class="feat-post">
					<div class="feat-content">
						<div class="entry">
						<h2>Lista de Viajes</h2>							
						</div>
							<table class="table">
								<tbody class="tbody">
									<tr>
										<th>Id Viaje</th>
										<th>Fecha de Llegada</th>
										<th>Finalizado</th>
										<th>Sucursal Origen</th>
										<th>Sucursal Destino</th>
										<th>Id Vehículo</th>
										<th>Envíos</th>
									</tr>
									<%
									List <ViajeDTO> viajes = Administrador.getInstance().listarViajes();
							 		for (ViajeDTO viaje : viajes) {
							 			String checkA="false";
							 			if (viaje.isFinalizado())
							 				checkA="checked";
						        	%>
									<tr>
										<td><%= viaje.getIdViaje() %></td>
										<td><%= viaje.getFechaLlegada() %></td>
										<td><input type="checkbox" <%=checkA %>></td>
										<td><%= viaje.getSucursalOrigen().getNombre() %></td>
										<td><%= viaje.getSucursalDestino().getNombre() %></td>
										<td><%= viaje.getVehiculo().getIdVehiculo() %></td>
										<td><a
											href="verEnvios.jsp?idViaje=<%=viaje.getIdViaje() %>"
											onClick="return popup(this, 'cargas')">Ver Envíos</a>
										</td>
										
										
									</tr>
									<% } %>
								</tbody>
							</table>
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