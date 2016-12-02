package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.Administrador;
import dto.CargaDTO;
import dto.ClienteDTO;
import dto.DireccionDTO;
import dto.PedidoDTO;

public class NuevoPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NuevoPedido() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PedidoDTO pedidoDto = new PedidoDTO();
		ClienteDTO clienteDto = new ClienteDTO();
		DireccionDTO direccionOrigen = new DireccionDTO();
		DireccionDTO direccionDestino = new DireccionDTO();

		if (request.getParameter("idCliente") != null) {
			int idCliente = Integer.parseInt(request.getParameter("idCliente"));
			clienteDto.setIdCliente(idCliente);
		}

		if (request.getParameter("idCarga") != null) {
			ArrayList<CargaDTO> cargas = new ArrayList<CargaDTO>();
			String[] selectedCargas = request.getParameterValues("idCarga");
			if (selectedCargas.length > 0) {
				for (int i = 0; i < selectedCargas.length; i++) {
					CargaDTO car = new CargaDTO();
					car = Administrador.getInstance().buscarCargaPorId(Integer.valueOf(selectedCargas[i]));
					cargas.add(car);
				}
			} else {
				CargaDTO car = new CargaDTO();
				String idCarga = request.getParameter("idCarga");
				car.setIdCarga(Integer.valueOf(idCarga));
				cargas.add(car);
			}
			pedidoDto.setCargas(cargas);

		}
		if (request.getParameter("calle") != null) {
			String calle = request.getParameter("calle");
			direccionOrigen.setCalle(calle);
		}
		if (request.getParameter("numero") != null) {
			int numero = Integer.parseInt(request.getParameter("numero"));
			direccionOrigen.setNumero(numero);
		}
		if (request.getParameter("piso") != null) {
			int piso = Integer.parseInt(request.getParameter("piso"));
			direccionOrigen.setPiso(piso);
		}
		if (request.getParameter("depto") != null) {
			String depto = request.getParameter("depto");
			direccionOrigen.setDepartamento(depto);
		}
		if (request.getParameter("cp") != null) {
			String cp = request.getParameter("cp");
			direccionOrigen.setCP(cp);
		}

		if (request.getParameter("calle2") != null) {
			String calle = request.getParameter("calle2");
			direccionDestino.setCalle(calle);
		}
		if (request.getParameter("numero2") != null) {
			int numero = Integer.parseInt(request.getParameter("numero2"));
			direccionDestino.setNumero(numero);
		}
		if (request.getParameter("piso2") != null) {
			int piso = Integer.parseInt(request.getParameter("piso2"));
			direccionDestino.setPiso(piso);
		}
		if (request.getParameter("depto2") != null) {
			String depto = request.getParameter("depto2");
			direccionDestino.setDepartamento(depto);
		}
		if (request.getParameter("cp2") != null) {
			String cp = request.getParameter("cp2");
			direccionDestino.setCP(cp);
		}
		if (request.getParameter("fechaCarga") != null) {

			String startDateStr = request.getParameter("fechaCarga");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// surround below line with try catch block as below code
			// throws checked exception
			Date startDate;
			try {
				startDate = sdf.parse(startDateStr);
				pedidoDto.setFechaCarga(startDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (request.getParameter("horaInicio") != null) {
			int horaInicio = Integer.valueOf(request.getParameter("horaInicio"));
			pedidoDto.setHoraInicio(horaInicio);
		}
		if (request.getParameter("horaFin") != null) {
			int horaFin = Integer.valueOf(request.getParameter("horaFin"));
			pedidoDto.setHoraInicio(horaFin);
		}

		if (request.getParameter("fechaMaxima") != null) {

			String startDateStr = request.getParameter("fechaMaxima");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// surround below line with try catch block as below code
			// throws checked exception
			Date startDate;
			try {
				startDate = sdf.parse(startDateStr);
				pedidoDto.setFechaMaxima(startDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (request.getParameter("precio") != null) {
			int precio = Integer.valueOf(request.getParameter("precio"));
			pedidoDto.setPrecio(precio);
		}
		if (request.getParameter("sucursalOrigen") != null) {
			int sucursalOrigenId = Integer.valueOf(request.getParameter("sucursalOrigen"));
			pedidoDto.setSucursalOrigenId(sucursalOrigenId);
			pedidoDto.setSucursalActualId(sucursalOrigenId);
		}
		if (request.getParameter("sucursalDestino") != "") {
			int sucursalDestinoId = Integer.valueOf(request.getParameter("sucursalDestino"));
			pedidoDto.setSucursalDestinoId(sucursalDestinoId);
		}
		if (request.getParameter("solicitaTransporteDirecto") != null) {
			String solicitaTransporteDirecto = request.getParameter("solicitaTransporteDirecto");
			boolean b = false;
			if (solicitaTransporteDirecto != null)
				b = true;
			pedidoDto.setSolicitaTransporteDirecto(b);
		}
		if (request.getParameter("solicitaAvionetaParticular") != null) {
			String solicitaAvionetaParticular = request.getParameter("solicitaAvionetaParticular");
			boolean b = false;
			if (solicitaAvionetaParticular != null)
				b = true;
			pedidoDto.setSolicitaAvionetaParticular(b);
		}
		pedidoDto.setEstado("pendiente");
		pedidoDto.setCliente(clienteDto);
		pedidoDto.setDireccionCarga(direccionOrigen);
		pedidoDto.setDireccionDestino(direccionDestino);
		Administrador.getInstance().crearPedido(pedidoDto);

//		PedidoDTO pedido2 = new PedidoDTO(pedidoDto.getIdPedido(), pedidoDto.getDireccionCarga(),
//				pedidoDto.getDireccionDestino(), pedidoDto.getFechaCarga(), pedidoDto.getHoraInicio(),
//				pedidoDto.getHoraFin(), pedidoDto.getFechaMaxima(), pedidoDto.getCargas(), pedidoDto.getPrecio(), pedidoDto.getSucursalDestinoId(), pedidoDto.getSucursalOrigenId(),
//				pedidoDto.getSucursalActualId(),false, false, pedidoDto.getCliente(), pedidoDto.getEstado());

//		Administrador.getInstance().crearPedido(pedido2);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("nuevoPedido.jsp");
		dispatcher.forward(request, response);

	}

}