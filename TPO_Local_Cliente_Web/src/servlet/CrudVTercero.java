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
import dto.VehiculoTerceroDTO;

public class CrudVTercero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudVTercero() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<VehiculoTerceroDTO> list = Administrador.getInstance().listarVTerceros();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<VehiculoTerceroDTO>>() {
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
				VehiculoTerceroDTO vehiculo = new VehiculoTerceroDTO();
				if (request.getParameter("idVehiculoTercero") != null) {
					int idVehiculoTercero = Integer.parseInt(request.getParameter("idVehiculoTercero"));
					vehiculo.setIdVehiculoTercero(idVehiculoTercero);
				}
				if (request.getParameter("tipoVehiculo") != null) {
					String tipoVehiculo = request.getParameter("tipoVehiculo");
					vehiculo.setTipoVehiculo(tipoVehiculo);
				}
				if (request.getParameter("precio") != null) {
					float precio = Float.valueOf(request.getParameter("precio"));
					vehiculo.setPrecio(precio);
				}
				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().crearVTercero(vehiculo);
						// Convert Java Object to Json
						String json = gson.toJson(vehiculo);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
					} else if (action.equals("update")) {
						// Update existing record
						Administrador.getInstance().modificarVTercero(vehiculo);

						// Convert Java Object to Json
						String json = gson.toJson(vehiculo);
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
					if (request.getParameter("idVehiculoTercero") != null) {
						int idVehiculoTercero = Integer.parseInt(request.getParameter("idVehiculoTercero"));
						VehiculoTerceroDTO v = new VehiculoTerceroDTO();
						v.setIdVehiculoTercero(idVehiculoTercero);
						Administrador.getInstance().eliminarVTercero(v);
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