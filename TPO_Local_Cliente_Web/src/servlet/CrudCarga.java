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
import dto.CargaDTO;

public class CrudCarga extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudCarga() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<CargaDTO> list = Administrador.getInstance().listarCargas();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<CargaDTO>>() {
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
				CargaDTO carga = new CargaDTO();
				if (request.getParameter("idCarga") != null) {
					int idCarga = Integer.parseInt(request.getParameter("idCarga"));
					carga.setIdCarga(idCarga);
				}

				if (request.getParameter("peso") != null) {
					float peso = Float.valueOf(request.getParameter("peso"));
					carga.setPeso(peso);
				}
				if (request.getParameter("ancho") != null) {
					float ancho = Float.valueOf(request.getParameter("ancho"));
					carga.setAncho(ancho);
				}
				if (request.getParameter("alto") != null) {
					float alto = Float.valueOf(request.getParameter("alto"));
					carga.setAlto(alto);
				}
				if (request.getParameter("volumen") != null) {
					float volumen = Float.valueOf(request.getParameter("volumen"));
					carga.setVolumen(volumen);
				}
				if (request.getParameter("fragilidad") != null) {
					String fragilidad = request.getParameter("fragilidad");
					carga.setFragilidad(fragilidad);
				}
				if (request.getParameter("profundidad") != null) {
					int profundidad = Integer.valueOf(request.getParameter("profundidad"));
					carga.setProfundidad(profundidad);
				}
				if (request.getParameter("tratamiento") != null) {
					String tratamiento = request.getParameter("tratamiento");
					carga.setTratamiento(tratamiento);
				}
				if (request.getParameter("apilable") != null) {
					int apilable = Integer.valueOf(request.getParameter("apilable"));
					carga.setApilable(apilable);
				}
				if (request.getParameter("refrigerable") != null) {
					String refrigerable = request.getParameter("refrigerable");
					boolean b;
					if (refrigerable.equals("true"))
						b = true;
					else
						b = false;
					carga.setRefrigerable(b);
				}
				if (request.getParameter("despachado") != null) {
					Boolean despachado = Boolean.getBoolean(request.getParameter("despachado"));
					carga.setDespachado(despachado);
				}
				if (request.getParameter("condiciones") != null) {
					String condiciones = request.getParameter("condiciones");
					carga.setCondiciones(condiciones);
				}
				if (request.getParameter("tipoMercaderia") != null) {
					String tipoMercaderia = request.getParameter("tipoMercaderia");
					carga.setMercaderia(tipoMercaderia);
				}

				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().createCarga(carga);
						// Convert Java Object to Json
						String json = gson.toJson(carga);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
					} else if (action.equals("update")) {
						// Update existing record
						Administrador.getInstance().updateCarga(carga);

						// Convert Java Object to Json
						String json = gson.toJson(carga);
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
					if (request.getParameter("idCarga") != null) {
						int idCarga = Integer.parseInt(request.getParameter("idCarga"));
						Administrador.getInstance().deleteCarga(idCarga);
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