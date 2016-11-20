<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Envíos | TPO AD</title>
	<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">

		<div class="featured col-full feat-blog">
			<div class="feat-post">
				<div class="feat-content">

					<div class="entry">

						<h2>Lista de Envíos</h2>
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
									<th>Pedidos</th>
								</tr>
								<%
								for (ViajeDTO viaje: Administrador.getInstance().listarViajes()){
					 				if (String.valueOf(viaje.getIdViaje()).equals(request.getParameter("idViaje"))){
					 					for(EnvioDTO e: viaje.getEnvios()){
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
										<td><a
											href="verPedidos.jsp?idPedido=<%=e.getPedido().getIdPedido() %>"
											onClick="return popup(this, 'cargas')">Ver Pedidos</a></td>


									</tr>
									<%
						 				}
						 			}
					 				
					 			}
								%>
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