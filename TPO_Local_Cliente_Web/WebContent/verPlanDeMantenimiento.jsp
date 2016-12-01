<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PlanDeMantenimiento | TPO AD</title>
	<link href="./css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">

		<div class="featured col-full feat-blog">
			<div class="feat-post">
				<div class="feat-content">

					<div class="entry">
						<h3>PlanDeMantenimiento</h3>
						<table border="1">
							<tbody>
								<tr>
									<th>idPlanDeMantenimiento</th>
									<th>Dias Próx Control</th>
									<th>Días Demora</th>
									<th>Km Próx Control</th>
									<th>Punto Controlar</th>
									<th>Tarea</th>
								</tr>
								<%
									PlanDeMantenimientoDTO t=Administrador.getInstance().obtenerPlanDeMantenimientoPorID(Integer.valueOf(request.getParameter("idPlanDeMantenimiento")));
										
								%>
								<tr>
									<td><%=t.getIdPlanDeMantenimiento() %></td>
									<td><%=t.getDiasProxControl() %></td>
									<td><%=t.getDiasDemora() %></td>
									<td><%=t.getKmProxControl() %></td>
									<td><%=t.getPuntoAControlar() %></td>
									<td><%=t.getTareas() %></td>
									
								</tr>
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
