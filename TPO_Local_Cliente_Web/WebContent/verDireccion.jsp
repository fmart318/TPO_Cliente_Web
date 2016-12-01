<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Direccion | TPO AD</title>
	<link href="./css/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrapper">

		<div class="featured col-full feat-blog">
			<div class="feat-post">
				<div class="feat-content">

					<div class="entry">
						<h3>Direccion</h3>
						<table border="1">
							<tbody>
								<tr>
									<th>idDireccion</th>
									<th>Calle</th>
									<th>Numero</th>
									<th>Piso</th>
									<th>Departamento</th>
									<th>CP</th>

								</tr>
								<%
									DireccionDTO t=Administrador.getInstance().obtenerDireccionPorId(Integer.valueOf(request.getParameter("idDireccion")));
										
								%>
								<tr>
									<td><%=t.getIdDireccion()%></td>
									<td><%=t.getCalle() %></td>
									<td><%=t.getNumero() %></td>
									<td><%=t.getPiso() %></td>
									<td><%=t.getDepartamento() %></td>
									<td><%=t.getCP() %></td>
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
