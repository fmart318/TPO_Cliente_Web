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
		
		PedidoDTO p=new PedidoDTO();
		PrecioVehiculoDTO pv= new PrecioVehiculoDTO();
		if (request.getParameter("idPedido") != null && request.getParameter("idPrecioVehiculo") != null) {
			int idPedido = Integer.valueOf(request.getParameter("idPedido"));

			int idPrecioVehiculo = Integer.valueOf(request.getParameter("idPrecioVehiculo"));
				
			Administrador.getInstance().crearEnvioDirecto(idPedido,idPrecioVehiculo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("envios.jsp");
		    dispatcher.forward(request, response);	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

	}
	
}