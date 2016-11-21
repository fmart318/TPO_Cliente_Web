package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
import dto.PrecioVehiculoDTO;

public class ContratarVehiculoTercero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContratarVehiculoTercero() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<PedidoDTO> pedidos=Administrador.getInstance().obtenerPedidos();
		PedidoDTO pedido=new PedidoDTO();
		for (PedidoDTO p: pedidos){
			if(p.getIdPedido()==Integer.valueOf(request.getParameter("idPedido"))){
				for(PrecioVehiculoDTO pv: Administrador.getInstance().listarVTerceros()){
					if(pv.getIdPrecioVehiculo()==Integer.valueOf(request.getParameter("idPrecioVehiculo"))){
						pedido.setIdPedido(p.getIdPedido());
						pedido.setCargas(p.getCargas());
						pedido.setCliente(p.getCliente());
						pedido.setDireccionCarga(p.getDireccionCarga());
						pedido.setDireccionDestino(p.getDireccionDestino());
						pedido.setFechaCarga(p.getFechaCarga());
						pedido.setFechaMaxima(p.getFechaMaxima());
						pedido.setPrecio(p.getPrecio()+pv.getPrecio());
						pedido.setHoraInicio(p.getHoraInicio());
						pedido.setHoraFin(p.getHoraFin());
						pedido.setSolicitaTransporteDirecto(p.isSolicitaTransporteDirecto());
						pedido.setSolicitaAvionetaParticular(p.isSolicitaAvionetaParticular());
						pedido.setSucursalDestino(p.getSucursalDestino());
						pedido.setSucursalOrigen(p.getSucursalOrigen());
						Administrador.getInstance().crearEnvioDirecto(p);
					}
				}
			}			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("envios.jsp");
	    dispatcher.forward(request, response);	
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

	}
	
}