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
import dto.DireccionDTO;
import dto.SucursalDTO;

public class CrudSucursal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudSucursal() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<SucursalDTO> list = Administrador.getInstance().listarSucursales();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<SucursalDTO>>() {
					}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData = jsonArray.toString();

					// Return Json in the format required by jTable plugin
					listData = "{\"Result\":\"OK\",\"Records\":" + listData + "}";
					response.getWriter().print(listData);
					System.out.println(listData);

				} catch (Exception e) {
					String error = "{\"Result\":\"ERROR\",\"Message\":" + "Exception on listing records }";
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}

			} else if (action.equals("create") || action.equals("update")) {

				SucursalDTO sucursal = new SucursalDTO();

				if (request.getParameter("nombre") != null) {
					String nombre = request.getParameter("nombre");
					sucursal.setNombre(nombre);
				}

				// TODO Hace falta levantar el listado de direcciones aca
				if (request.getParameter("idDireccion") != "") {
					int idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
					sucursal.setUbicacion(Administrador.getInstance().obtenerDireccionPorId(idDireccion));
				}

				// TODO Hace falta levantar todo los viajes que se hizo

				try {
					if (action.equals("create")) {

						sucursal.setIdSucursal(list.size() + 1);
						// Create new record
						Administrador.getInstance().altaSucursal(sucursal);

						// Convert Java Object to Json
						String json = gson.toJson(sucursal);

						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);

					} else if (action.equals("update")) {

						// Update existing record
						Administrador.getInstance().updateSucursal(sucursal);

						// Convert Java Object to Json
						String json = gson.toJson(sucursal);
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
					if (request.getParameter("idSucursal") != null) {
						int idSucursal = Integer.parseInt(request.getParameter("idSucursal"));
						Administrador.getInstance().deleteSucursal(idSucursal);
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