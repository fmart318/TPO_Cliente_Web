<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Pedidos | TPO AD </title>
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

						<h2>Lista de Pedidos</h2>

								<a id="nuevoPedido" href="nuevoPedido.jsp" onClick="return popup(this, 'nuevoPedido')">
								<input type="submit" value="Nuevo Pedido" />
								</a>
							
						</div>
							<table class="table">
								<tbody class="tbody">
									<tr>
										<th>Id Pedido</th>
										<th>Id Cliente</th>
										<th>Id Dir. Carga</th>
										<th>Id Dir. Destino</th>
										<th>Fecha Carga</th>
										<th>Hora Inicio</th>
										<th>Hora Fin</th>
										<th>Fecha Máxima</th>
										<th>Precio</th>
										<th>Suc Origen</th>
										<th>Suc Destino</th>
										<th>Solicita Trans Dto.</th>
										<th>Solicita Avioneta</th>
										<th>Cargas</th>
										<th>Contratar Vehículo</th>
									</tr>
									<%
									List <PedidoDTO> pedidos = (List <PedidoDTO>) request.getSession().getAttribute("pedidos");
									PrecioVehiculoDTO pv=new PrecioVehiculoDTO();
									int idPedido=0;
							 		for (PedidoDTO pedido : pedidos) {
							 			idPedido=pedido.getIdPedido();
							 			String checkA="false";
							 			String checkB="false";
							 			if (pedido.isSolicitaTransporteDirecto())
							 				checkA="checked";
							 			if (pedido.isSolicitaAvionetaParticular())
							 				checkB="checked";
						        	%>
									<tr>
									<form action="./ContratarVehiculoTercero" name="ContratarVehiculoTercero" method="GET">
										<td><%= pedido.getIdPedido() %></td>
										<td><%= pedido.getCliente().getIdCliente() %></td>
										<td><%= pedido.getDireccionCarga().getIdDireccion() %></td>
										<td><%= pedido.getDireccionDestino().getIdDireccion() %></td>
										<td><%= pedido.getFechaCarga() %></td>
										<td><%= pedido.getHoraInicio() %></td>
										<td><%= pedido.getHoraFin() %></td>
										<td><%= pedido.getFechaMaxima() %></td>
										<td><%= pedido.getPrecio() %></td>
										<td><%= pedido.getSucursalOrigen() %></td>
										<td><%= pedido.getSucursalDestino() %></td>
										<td><input type="checkbox" <%=checkA %>></td>
										<td><input type="checkbox" <%=checkB %>></td>
										<td><a
											href="verCargas.jsp?idPedido=<%=pedido.getIdPedido() %>"
											onClick="return popup(this, 'cargas')">Ver Cargas</a>
										</td>
										
										
										<% 
										boolean tieneE=true;
										for (EnvioDTO env:Administrador.getInstance().listarEnvios()){
											if(pedido.getIdPedido()==env.getPedido().getIdPedido()){
												tieneE=false;
											}
											
										}
										
										if (pedido.isSolicitaTransporteDirecto()||pedido.isSolicitaAvionetaParticular()){
											if(tieneE){
												
												
													
												
										%>
										<td>
											<input type="text" name="idPedido" value="<%= pedido.getIdPedido() %>"readonly size="1">
											<select class="selectpicker" id="idPrecioVehiculo"name="idPrecioVehiculo" required>
												<%
												List <PrecioVehiculoDTO> vehiculos = Administrador.getInstance().listarVTerceros();
										 		for (PrecioVehiculoDTO v : vehiculos) {
										        %>
											  <option value="<%= v.getIdPrecioVehiculo()%>"><%= v.getTipoVehiculo()+" Precio: $"+v.getPrecio() %></option>
												<%}%>
											</select>
											<input type="submit" value="Contratar" >
										</form>
										</td>
										
										<%
										
										
										}
										}
										
											
										%>
										
										
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