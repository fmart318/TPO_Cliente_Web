<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Pedidos | TPO AD</title>
	<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">

		<div class="featured col-full feat-blog">
			<div class="feat-post">
				<div class="feat-content">

					<div class="entry">

						<h2>Lista de Pedidos</h2>
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
										<th>Fecha M�xima</th>
										<th>Precio</th>
										<th>Suc Origen</th>
										<th>Suc Destino</th>
										<th>Solicita Trans Dto.</th>
										<th>Solicita Avioneta</th>
										<th>Cargas</th>
									</tr>
									<%
									List <PedidoDTO> pedidos = Administrador.getInstance().obtenerPedidos();
							 		for (PedidoDTO pedido : pedidos) {
							 			if (String.valueOf(pedido.getIdPedido()).equals(request.getParameter("idPedido"))){
							 				String checkA="false";
								 			String checkB="false";
								 			if (pedido.isSolicitaTransporteDirecto())
								 				checkA="checked";
								 			if (pedido.isSolicitaAvionetaParticular())
								 				checkB="checked";
							        	%>
										<tr>
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
											
											
										</tr>
										<%
							 			}
							 			 } %>
								</tbody>
							</table>
					</div>
					<div class="fix"></div>
				</div>
			</div>
		</div>

		<div class="fix"></div>
	</div>

</body>
</html>