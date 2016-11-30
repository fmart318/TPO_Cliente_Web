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
import dto.VehiculoAMantenerDTO;
import dto.VehiculoDTO;

public class CrudVehiculosAMantener extends HttpServlet {

	private static final long serialVersionUID = -5940448396481255443L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrudVehiculosAMantener() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Administrador.getInstance().getVehiculosMantenimiento();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		List<VehiculoAMantenerDTO> list = Administrador.getInstance().getVehiculosMantenimiento();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<VehiculoAMantenerDTO>>() {
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
			} else {
				try {
					List<VehiculoDTO> vehiculos = Administrador.getInstance().listarVehiculos();
					for (VehiculoDTO v : vehiculos) {
						if (Integer.parseInt(request.getParameter("idVehiculo")) == v.getIdVehiculo()) {
							v.setEstado(request.getParameter("estado"));
							Administrador.getInstance().modificarVehiculo(v);

							String json = gson.toJson(v);
							String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
							response.getWriter().print(listData);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
