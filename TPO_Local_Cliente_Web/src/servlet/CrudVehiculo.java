package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import Negocio.Administrador;
import dto.VehiculoDTO;

public class CrudVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrudVehiculo() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		List<VehiculoDTO> list = Administrador.getInstance().listarVehiculos();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		response.setContentType("application/json");

		if (action != null) {
			if (action.equals("list")) {
				try {
					// Convert Java Object to Json
					JsonElement element = gson.toJsonTree(list, new TypeToken<List<VehiculoDTO>>() {
					}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData = jsonArray.toString();
					System.out.println(listData);
					// Return Json in the format required by jTable plugin
					listData = "{\"Result\":\"OK\",\"Records\":" + listData + "}";
					response.getWriter().print(listData);
				} catch (Exception e) {
					String error = "{\"Result\":\"ERROR\",\"Message\":" + "Exception on listing records }";
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}
			} else if (action.equals("create") || action.equals("update")) {
				VehiculoDTO vehiculo = new VehiculoDTO();
				if (request.getParameter("idVehiculo") != null) {
					int idVehiculo = Integer.valueOf(request.getParameter("idVehiculo"));
					vehiculo.setIdVehiculo(idVehiculo);
				}

				if (request.getParameter("peso") != null) {
					float peso = Float.valueOf(request.getParameter("peso"));
					vehiculo.setPeso(peso);
				}
				if (request.getParameter("ancho") != null) {
					float ancho = Float.valueOf(request.getParameter("ancho"));
					vehiculo.setAncho(ancho);
				}
				if (request.getParameter("alto") != null) {
					float alto = Float.valueOf(request.getParameter("alto"));
					vehiculo.setAlto(alto);
				}
				if (request.getParameter("profundidad") != null) {
					int profundidad = Integer.valueOf(request.getParameter("profundidad"));
					vehiculo.setProfundidad(profundidad);
				}
				
				if (request.getParameter("sucursalIdActual") != null) {
					int sucursalIdActual = Integer.valueOf(request.getParameter("sucursalIdActual"));
					vehiculo.setSucursalIdActual(sucursalIdActual);
				}
				if (request.getParameter("volumen") != null) {
					//float volumen = Float.valueOf(request.getParameter("volumen"));
					vehiculo.setVolumen(vehiculo.getAlto()*vehiculo.getAlto()*vehiculo.getProfundidad());
				}
				
				if (request.getParameter("tara") != null) {
					float tara = Float.valueOf(request.getParameter("tara"));
					vehiculo.setTara(tara);
				}
				if (request.getParameter("kilometraje") != null) {
					int kilometraje = Integer.valueOf(request.getParameter("kilometraje"));
					vehiculo.setKilometraje(kilometraje);
				}
				if (request.getParameter("estado") != null) {
					String estado = request.getParameter("estado");
					vehiculo.setEstado(estado);
				}
				if (request.getParameter("trabajoEspecifico") != null) {
					String trabajoEspecifico = request.getParameter("trabajoEspecifico");
					boolean b = false;
					if (trabajoEspecifico.equals("true"))
						b = true;
					else
						b = false;
					vehiculo.setTrabajoEspecifico(b);
				}
				if (request.getParameter("enGarantia") != null) {
					String enGarantia = request.getParameter("enGarantia");
					boolean b = false;
					if (enGarantia.equals("true"))
						b = true;
					else
						b = false;
					vehiculo.setEnGarantia(b);
				}
				if (request.getParameter("fechaUltimoControl") != null) {

					String startDateStr = request.getParameter("fechaUltimoControl");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					// surround below line with try catch block as below code
					// throws checked exception
					Date startDate;
					try {
						startDate = sdf.parse(startDateStr);
						vehiculo.setFechaUltimoControl(startDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (request.getParameter("idPlanDeMantenimiento") != "") {
					int idPlanDeMantenimiento = Integer.valueOf(request.getParameter("idPlanDeMantenimiento"));
					vehiculo.setPlanDeMantenimiento(Administrador.getInstance().obtenerPlanDeMantenimientoPorID(idPlanDeMantenimiento));
				}

				try {
					if (action.equals("create")) {
						// Create new record
						Administrador.getInstance().crearVehiculo(vehiculo);
						// Convert Java Object to Json
						String json = gson.toJson(vehiculo);
						// Return Json in the format required by jTable plugin
						String listData = "{\"Result\":\"OK\",\"Record\":" + json + "}";
						response.getWriter().print(listData);
					} else if (action.equals("update")) {
						// Update existing record
						Administrador.getInstance().modificarVehiculo(vehiculo);

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
					if (request.getParameter("idVehiculo") != null) {
						int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
						VehiculoDTO v = new VehiculoDTO();
						v.setIdVehiculo(idVehiculo);
						Administrador.getInstance().eliminarVehiculo(v);
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