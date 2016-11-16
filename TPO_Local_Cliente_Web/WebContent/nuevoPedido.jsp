<%@ page import="dto.*"%>
<%@ page import="Negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Nuevo Pedido | TPO AD</title>
<!-- 	<link href="css/styles.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="css/styles.css" rel="stylesheet" type="text/css" /> -->
	  <link href="css/bootstrap.min.css" rel="stylesheet" />
	  <script src="js/jquery-3.1.1.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container">
	
    <div class="row">
      <div class="col-sm-6">
        <h2>Nuevo Pedido</h2>
      </div>
    </div>
	
	<div class="row">
	  <div class="col-sm-6">
	    <div class="panel panel-primary">
	      <div class="panel-heading">
	        Product Information
	      </div>
			<div class="panel-body">
				<div class="form-group">
				  <label for="idCliente">idCliente</label>
						<select class="selectpicker" data-live-search="true">
							<%
							List <ClienteDTO> clientes = Administrador.getInstance().obtenerClientes();
					 		for (ClienteDTO c : clientes) {
					        %>
						  <option data-tokens="<%= c.getIdCliente() %>"><%= c.getNombre() %></option>
							<%}%>
						</select>
				</div>
				<div class="form-group">
				  <label for="">Dirección de Carga</label>
					<input type="text" id="calle" class="form-control" placeholder="Calle" value="Av. Dardo Rocha"/>
					<input type="number" id="numero" class="form-control" placeholder="Número" value="5402"/>
					<input type="number" id="piso" class="form-control" placeholder="Piso" value="2" />
					<input type="text" id="depto" class="form-control" placeholder="Depto" value="A" />
					<input type="number" id="cp" class="form-control" placeholder="CP" value="1883"/>
				</div>
				<div class="form-group">
				  <label for="">Dirección de Destino</label>
				  <input type="text" id="calle2" class="form-control" placeholder="Calle" value="Av. Mitre"/>
				  <input type="number" id="numero2" class="form-control" placeholder="Número" value="5402"/>
				  <input type="number" id="piso2" class="form-control" placeholder="Piso" value="10" />
				  <input type="text" id="depto2" class="form-control" placeholder="Depto" value="F" />
				  <input type="number" id="cp2" class="form-control" placeholder="CP" value="1884"/>
				</div>
				<div class="form-group">
				  <label for="fechaCarga">Fecha Carga</label>
				  <input type="date" id="fechaCarga" class="form-control" placeholder="Fecha" value="16/11/2016"/>
				</div>
				<div class="form-group">
				  <label for="fechaCarga">horaInicio</label>
				  <input type="time" id="horaInicio" class="form-control" placeholder="Hora Inicio" value="9"/>
				</div>
				<div class="form-group">
				  <label for="horaFin">horaFin</label>
				  <input type="time" id="horaFin" class="form-control" placeholder="Hora Fin" value="10"/>
				</div>
				<div class="form-group">
				  <label for="fechaMaxima">Fecha Máxima</label>
				  <input type="date" id="fechaMaxima" class="form-control" placeholder="Fecha Máx" value='24/11/2016' />
				</div>
				<div class="form-group">
				  <label for="precio">Precio</label>
				  <input type="text" id="precio" class="form-control" placeholder="Precio" value="150"/>
				</div>
				<div class="form-group">
				  <label for="sucursalOrigen">Sucursal Origen</label>
				  <input type="text" id="sucursalOrigen" class="form-control" placeholder="Sucursal Origen" value="Quilmes"/>
				</div>
				<div class="form-group">
				  <label for="sucursalDestino">Sucursal Destino</label>
				  <input type="text" id="sucursalDestino" class="form-control" placeholder="Sucursal Destino" value="Berazategui"/>
				</div>
				
			</div>
			<div class="panel-footer">
			 	<div class="row">
					<div class="col-xs-12">
						<button type="button" id="updateButton"
					        class="btn btn-primary"
					        onclick="updateClick();">
					   Terminar
					</button>
				</div>
				</div>
			</div>
		</div>
	  </div>
	</div>
	
  </div>

</body>
</html>