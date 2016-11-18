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
	  <link href="css/bootstrap-select.min.css" rel="stylesheet" />
	  <link href="css/bootstrap.min.css" rel="stylesheet" />
	  <script src="js/jquery-3.1.1.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  <script src="js/bootstrap-select.min.js"></script>
	  
	  
	<script type="text/javascript">
	function closeSelf(){
	       document.forms['nuevoPedido'].submit();
	       window.close(), 3000;
	
	}
	$( function() {
	  $( "#fechaCarga" ).datepicker();
	} );
	
	</script>
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
	        Datos del Pedido
	      </div>
	      <form action="./NuevoPedido" name="nuevoPedido" method="post">
	      
			<div class="panel-body">
				<div class="form-group">				
				  <label for="idCliente">Cliente</label>
						<select class="selectpicker" name="idCliente" data-live-search="true" required>
							<%
							List <ClienteDTO> clientes = Administrador.getInstance().obtenerClientes();
					 		for (ClienteDTO c : clientes) {
					        %>
						  <option  data-tokens="<%= c.getIdCliente()+" "+c.getNombre()  %>" ><%= c.getIdCliente() %></option>
							<%}%>
						</select>
				</div>
				<div class="form-group">				
				  <label for="idCliente">Cargas</label>
						<select class="selectpicker" name="idCarga" multiple required>
							<%
							List <CargaDTO> cargas = Administrador.getInstance().listarCargas();
					 		for (CargaDTO c : cargas) {
					        %>
						  <option  data-tokens="<%= c.getIdCarga() %>" ><%= c.getIdCarga() %></option>
							<%}%>
						</select>
				</div>
				<div class="form-group">
				  <label for="">Dirección de Carga</label>
					<input type="text" name="calle" class="form-control" placeholder="Calle" value="Av. Dardo Rocha"/>
					<input type="number" name="numero" class="form-control" placeholder="Número" value="5402"/>
					<input type="number" name="piso" class="form-control" placeholder="Piso" value="2" />
					<input type="text" name="depto" class="form-control" placeholder="Depto" value="A" />
					<input type="text" name="cp" class="form-control" placeholder="CP" value="1883"/>
				</div>
				<div class="form-group">
				  <label for="">Dirección de Destino</label>
				  <input type="text" name="calle2" class="form-control" placeholder="Calle" value="Av. Mitre"/>
				  <input type="number" name="numero2" class="form-control" placeholder="Número" value="5402"/>
				  <input type="number" name="piso2" class="form-control" placeholder="Piso" value="10" />
				  <input type="text" name="depto2" class="form-control" placeholder="Depto" value="F" />
				  <input type="text" name="cp2" class="form-control" placeholder="CP" value="1884"/>
				</div>
				<div class="form-group">
				  <label for="fechaCarga">Fecha Carga</label>
				  <input type="date" id="fechaCarga" name="fechaCarga" class="form-control" value="2016-11-17" required/>
				</div>
				<div class="form-group">
				  <label for="fechaCarga">horaInicio</label>
				  <input type="number" name="horaInicio" class="form-control" placeholder="Hora Inicio" value="9"/>
				</div>
				<div class="form-group">
				  <label for="horaFin">horaFin</label>
				  <input type="number" name="horaFin" class="form-control" placeholder="Hora Fin" value="10"/>
				</div>
				<div class="form-group">
				  <label for="fechaMaxima">Fecha Máxima</label>
				  <input type="date" id="fechaMaxima" name="fechaMaxima" class="form-control" value='2016-11-18' required />
				</div>
				<div class="form-group">
				  <label for="precio">Precio</label>
				  <input type="text" name="precio" class="form-control" placeholder="Precio" value="150"/>
				</div>
				<div class="form-group">
				  <label for="sucursalOrigen">Sucursal Origen</label>
				  <input type="text" name="sucursalOrigen" class="form-control" placeholder="Sucursal Origen" value="Quilmes"/>
				</div>
				<div class="form-group">
				  <label for="sucursalDestino">Sucursal Destino</label>
				  <input type="text" name="sucursalDestino" class="form-control" placeholder="Sucursal Destino" value="Berazategui"/>
				</div>
				
				<div class="form-group">
				  <label for="solicitaTransporteDirecto">solicitaTransporteDirecto</label>
				  <span class="input-group-addon">
					<input name="solicitaTransporteDirecto" type="checkbox" aria-label="...">
					</span>
				</div>
				<div class="form-group">
				  <label for="solicitaAvionetaParticular">solicitaAvionetaParticular</label>
				  <span class="input-group-addon">
					<input name="solicitaAvionetaParticular" type="checkbox" aria-label="...">
					</span>
				</div>
				
			</div>
			<div class="panel-footer">
			 	<div class="row">
					<div class="col-xs-12">
						<div class="form-actions">
											<input type="submit" id=add value="Generar Envío"  />
						</div>
				</div>
				</div>
			</div>
			</form>
		</div>
	  </div>
	</div>
	
  </div>

</body>
</html>