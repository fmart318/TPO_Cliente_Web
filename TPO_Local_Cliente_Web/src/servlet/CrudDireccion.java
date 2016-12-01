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

public class CrudDireccion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudDireccion() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<DireccionDTO> list = Administrador.getInstance().listarDirecciones();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<DireccionDTO>>() {
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
				DireccionDTO dir = new DireccionDTO();
				if (request.getParameter("idDireccion") != null) {
					int idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
					dir.setIdDireccion(idDireccion);
				}
				if (request.getParameter("calle") != null) {
					String calle = request.getParameter("calle");
					dir.setCalle(calle);
				}
				if (request.getParameter("departamento") != null) {
					String departamento = request.getParameter("departamento");
					dir.setDepartamento(departamento);
				}
				if (request.getParameter("numero") != null) {
					int numero = Integer.valueOf(request.getParameter("numero"));
					dir.setNumero(numero);
				}
				if (request.getParameter("CP") != null) {
					String cp = request.getParameter("CP");
					dir.setCP(cp);
				}

				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().crearDireccion(dir);
						// Convert Java Object to Json
						String json = gson.toJson(dir);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
					} else if (action.equals("update")) {
						// Update existing record
						Administrador.getInstance().modificarDireccion(dir);

						// Convert Java Object to Json
						String json = gson.toJson(dir);
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
					if (request.getParameter("idDireccion") != null) {
						int idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
						Administrador.getInstance().eliminarDireccion(Administrador.getInstance().obtenerDireccionPorId(idDireccion));
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