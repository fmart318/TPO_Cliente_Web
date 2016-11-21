<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Envíos | TPO AD</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css" />
<!-- Include one of jTable styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />
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
					<li><a href="viajes.jsp">Viajes</a></li>					
					<li><a href="facturas.jsp">Facturas</a></li>
				</ul>
			</div>

			<div class="featured col-full feat-blog">
				<div class="feat-post">
					<div class="feat-content">

						<div class="entry">

							<h2>Lista de Envíos</h2>
						</div>
						<table class="table">
							<tbody class="tbody">
								<tr>
									<th>Id Envío</th>
									<th>Fecha Salida</th>
									<th>Fecha Llegada</th>
									<th>Cumple Condiciones de Carga</th>
									<th>Estado</th>
									<th>Prioridad</th>
									<th>Sucursal Origen</th>
									<th>Sucursal Destino</th>
									<th>Pedidos</th>
								</tr>
									<%
									List <EnvioDTO> envios = Administrador.getInstance().listarEnvios();
							 		for (EnvioDTO e : envios) {
							 			String checkA="false";
							 			if (e.isCumpleCondicionesCarga())
							 				checkA="checked";
						        	%>
								<tr>
									<td><%= e.getIdEnvio() %></td>
									<td><%= e.getFechaSalida() %></td>
									<td><%= e.getFechaLlegada() %></td>
									<td><input type="checkbox" <%=checkA %>></td>
									<td><%= e.getEstado() %></td>
									<td><%= e.getPrioridad() %></td>
									<td><%= e.getSucursalOrigen() %></td>
									<td><%= e.getSucursalDestino() %></td>
									<td><a
										href="verPedidos.jsp?idPedido=<%=e.getPedido().getIdPedido() %>"
										onClick="return popup(this, 'cargas')">Ver Pedidos</a></td>


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
</body>
</html>