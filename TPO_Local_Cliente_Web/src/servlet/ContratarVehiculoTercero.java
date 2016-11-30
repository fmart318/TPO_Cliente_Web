package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.Administrador;

public class ContratarVehiculoTercero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContratarVehiculoTercero() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("idPedido") != null) {
			int idPedido = Integer.valueOf(request.getParameter("idPedido"));
			Administrador.getInstance().crearEnvioDirecto(idPedido);
			RequestDispatcher dispatcher = request.getRequestDispatcher("envios.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}