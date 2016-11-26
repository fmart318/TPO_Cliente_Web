package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import Negocio.Administrador;
import dto.EmpresaDTO;
import dto.FacturaDTO;
import dto.PedidoDTO;

public class CrudFactura extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudFactura() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<FacturaDTO> list = Administrador.getInstance().listarFacturas();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<FacturaDTO>>() {
					}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData = jsonArray.toString();

					// Return Json in the format required by jTable plugin
					listData = "{\"Result\":\"OK\",\"Records\":" + listData + "}";
					response.getWriter().print(listData);
				} catch (Exception e) {
					String error = "{\"Result\":\"ERROR\",\"Message\":" + "Exception on listing records }";
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}
			} else if (action.equals("create") || action.equals("update")) {
				FacturaDTO factura = new FacturaDTO();
				if (request.getParameter("idFactura") != null) {
					int idFactura = Integer.parseInt(request.getParameter("idFactura"));
					factura.setIdFactura(idFactura);
				}

				if (request.getParameter("pedido") != null) {
					int idPedido = Integer.parseInt(request.getParameter("pedido"));
					List<PedidoDTO> pedidos = Administrador.getInstance().obtenerPedidos();
					for (PedidoDTO pedido : pedidos) {
						if (pedido.getIdPedido() == idPedido) {
							factura.setPedido(pedido);
						}
					}
				}
				
				if (request.getParameter("precio") != null) {
					int precio = Integer.parseInt(request.getParameter("precio"));
					factura.setPrecio(precio);
				}

				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().altaFactura(factura);
						// Convert Java Object to Json
						String json = gson.toJson(factura);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
					}
				} catch (Exception e) {
					String error = "{\"Result\":\"ERROR\",\"Message\":" + "Exception in creating records }";
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}

			} else if (action.equals("delete")) {
				try {
					// Delete record
					if (request.getParameter("idFactura") != null) {
						int idFactura = Integer.parseInt(request.getParameter("idFactura"));
						Administrador.getInstance().deleteFactura(idFactura);
						String listData = "{\"Result\":\"OK\"}";
						response.getWriter().print(listData);
					}
				} catch (Exception e) {
					String error = "{\"Result\":\"ERROR\",\"Message\":" + " Exception in deleting records }";
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}
			}
		}
	}
}