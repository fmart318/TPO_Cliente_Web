<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="dto.VehiculoDTO"%>
<%@page import="Negocio.Administrador"%>
<%@page import="dto.VehiculoAMantenerDTO"%>
<%@page import="java.util.List"%>
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
	function actualizar() {
		<%
		if (request.getParameter("idVehiculo") != null) {
			int numeroVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
			List<VehiculoAMantenerDTO> vehiculosAMantener = Administrador.getInstance().getVehiculosMantenimiento();
			for (VehiculoAMantenerDTO aMantener : vehiculosAMantener) {
				if (aMantener.getIdVehiculo() == numeroVehiculo) {
					if (aMantener.getEstado().toLowerCase().equals("libre")) {
						aMantener.setEstado("En Mantenimiento");
						aMantener.getVehiculo().setEstado("En Mantenimiento");
						Administrador.getInstance().modificarVehiculo(aMantener.getVehiculo());
					} else { %>
						window.alert("El vehiculo no puede ser enviado a mantenimiento")
					<%}%>
					window.location.replace("http://localhost:8080/TPO_Local_Cliente_Web/vehiculosAMantener.jsp")
					<%}
			}
		}
		%>
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

						<h2>Vehiculos a Mantener</h2>
							
						</div>
							<table class="table">
								<tbody class="tbody">
									<tr>
										<th>Id Vehiculo</th>
										<th>Necesita Mantenimiento</th>
										<th>Tipo de Trabajo</th>
										<th>Punto a Controlar</th>
										<th>Tareas a Realizar</th>
										<th>Estado</th>
										<th></th>
									</tr>
									<%
									List <VehiculoAMantenerDTO> vehiculos = Administrador.getInstance().getVehiculosMantenimiento();
									int idVehiculo = 0;
							 		for (VehiculoAMantenerDTO vehiculo : vehiculos) {
							 			idVehiculo = vehiculo.getIdVehiculo();
						        	%>
									<tr>
										<td><%= idVehiculo %></td>
										<td>Si</td>
										<td><%= vehiculo.getTipoDeTrabajo() %></td>
										<td><%= vehiculo.getPuntoAControlar() %></td>
										<td><%= vehiculo.getTareas() %></td>
										<td><%= vehiculo.getEstado() %></td>
										<td><a
											href="vehiculosAMantener.jsp?idVehiculo=<%=vehiculo.getIdVehiculo()%>"
											onClick="actualizar()">Enviar a Mantenimiento</a>
										</td>
										<%
										}
										%>
									</tr>
								</tbody>
							</table>
						</div>
	
	
						</div>

			<div class="fix"></div>
		</div>
</div>
</body>
</html>