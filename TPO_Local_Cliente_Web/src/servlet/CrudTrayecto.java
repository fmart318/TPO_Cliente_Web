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
import dto.TrayectoDTO;

public class CrudTrayecto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudTrayecto() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<TrayectoDTO> list = Administrador.getInstance().listarTrayectos();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<TrayectoDTO>>() {
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

				TrayectoDTO trayecto = new TrayectoDTO();

				if (request.getParameter("tiempo") != null) {
					float tiempo = Float.parseFloat(request.getParameter("tiempo"));
					trayecto.setTiempo(tiempo);
				}
				
				if (request.getParameter("km") != null) {
					int km = Integer.parseInt(request.getParameter("km"));
					trayecto.setKm(km);
				}
				
				if (request.getParameter("precio") != null) {
					float precio = Float.parseFloat(request.getParameter("precio"));
					trayecto.setPrecio(precio);
				}
				
				// TODO Hace falta levantar el listado de direcciones y viajes de la sucursal aca
				if (request.getParameter("idSucursalDestino") != null) {
					int idSucursalDestino = Integer.parseInt(request.getParameter("idSucursalDestino"));
					DireccionDTO direccionSucursalDestino = new DireccionDTO(1, "Calle 16", 5403, 2,
							"F", "1884");
					SucursalDTO sucursalDestino = new SucursalDTO(idSucursalDestino, "Felipe", direccionSucursalDestino, null);
					trayecto.setSucursalDestino(sucursalDestino);
				}
				
				// TODO Hace falta levantar el listado de direcciones y viajes de la sucursal aca
				if (request.getParameter("idSucursalOrigen") != null) {
					int idSucursalOrigen = Integer.parseInt(request.getParameter("idSucursalOrigen"));
					DireccionDTO direccionSucursalOrigen = new DireccionDTO(1, "Calle 16", 5403, 2,
							"F", "1884");
					SucursalDTO sucursalOrigen = new SucursalDTO(idSucursalOrigen, "Felipe", direccionSucursalOrigen, null);
					trayecto.setSucursalOrigen(sucursalOrigen);
				}
				
				// TODO Hace falta levantar el listado de rutas

				try {
					if (action.equals("create")) {
						
						trayecto.setIdTrayecto(list.size()+1);
						
						// Create new record
						Administrador.getInstance().altaTrayecto(trayecto);
						
						// Convert Java Object to Json
						String json = gson.toJson(trayecto);
						
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
						
					} else if (action.equals("update")) {
						
						// Update existing record
						Administrador.getInstance().updateTrayecto(trayecto);

						// Convert Java Object to Json
						String json = gson.toJson(trayecto);
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
					if (request.getParameter("idTrayecto") != null) {
						int idTrayecto = Integer.parseInt(request.getParameter("idTrayecto"));
						Administrador.getInstance().deleteTrayecto(idTrayecto);
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