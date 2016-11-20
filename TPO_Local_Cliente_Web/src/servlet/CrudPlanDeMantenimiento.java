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
import dto.PlanDeMantenimientoDTO;

public class CrudPlanDeMantenimiento extends HttpServlet {

	private static final long serialVersionUID = 6586010562280275653L;

	public CrudPlanDeMantenimiento() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<PlanDeMantenimientoDTO> list = Administrador.getInstance().listarPlanDeMantenimiento();
		Gson gson = new Gson();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
			
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<EmpresaDTO>>() {
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
				PlanDeMantenimientoDTO plan = new PlanDeMantenimientoDTO();
				if (request.getParameter("idPlanDeMantenimiento") != null) {
					int idPlanDeMantenimiento = Integer.parseInt(request.getParameter("idPlanDeMantenimiento"));
					plan.setIdPlanDeMantenimiento(idPlanDeMantenimiento);
				}

				if (request.getParameter("diasProxControl") != null) {
					int diasProxControl = Integer.parseInt(request.getParameter("diasProxControl"));
					plan.setDiasProxControl(diasProxControl);
				}
				
				if (request.getParameter("diasDemora") != null) {
					int diasDemora = Integer.parseInt(request.getParameter("diasDemora"));
					plan.setDiasDemora(diasDemora);
				}
				
				if (request.getParameter("kmProxControl") != null) {
					int kmProxControl = Integer.parseInt(request.getParameter("kmProxControl"));
					plan.setKmProxControl(kmProxControl);
				}
				
				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().altaPlanDeMantenimiento(plan);
						// Convert Java Object to Json
						String json = gson.toJson(plan);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
						
					} else if (action.equals("update")) {
						// Update existing record
						Administrador.getInstance().updatePlanDeMantenimiento(plan);

						// Convert Java Object to Json
						String json = gson.toJson(plan);
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
					if (request.getParameter("idPlanDeMantenimiento") != null) {
						int idPlan = Integer.parseInt(request.getParameter("idPlanDeMantenimiento"));
						Administrador.getInstance().deletePlanDeMantenimiento(idPlan);
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