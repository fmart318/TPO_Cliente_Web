package servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import dto.ClienteDTO;
import dto.DireccionDTO;
import dto.EmpresaDTO;
import dto.HabilitadoDTO;
import dto.ParticularDTO;


public class CrudHabilitado extends HttpServlet {
private static final long serialVersionUID = 1L;


public CrudHabilitado() {
}

protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
}

protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {

String action = request.getParameter("action");

List<HabilitadoDTO> list = Administrador.getInstance().listarHabilitados();
Gson gson = new Gson();
response.setContentType("application/json");

if (action != null) {
	if (action.equals("list")) {
	try {
		// Convert Java Object to Json
		JsonElement element = gson.toJsonTree(list,
				new TypeToken<List<HabilitadoDTO>>() {}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		String listData = jsonArray.toString();

		// Return Json in the format required by jTable plugin
		listData = "{\"Result\":\"OK\",\"Records\":" 
		+ listData + "}";
		response.getWriter().print(listData);
		} catch (Exception e) {
			String error = "{\"Result\":\"ERROR\",\"Message\":"
					+ "Exception on listing records }";
			response.getWriter().print(error);
			System.err.println(e.getMessage());
		}
	} else if (action.equals("create") || action.equals("update")) {
		HabilitadoDTO h=new HabilitadoDTO();
		if (request.getParameter("dniHabilitado") != null) {
		String dniHabilitado = request.getParameter("dniHabilitado");
		h.setDniHabilitado(dniHabilitado);
		}
		if (request.getParameter("nombre") != null) {
			String nombre = request.getParameter("nombre");
			h.setNombre(nombre);
		}
		
		
		
		try {
			if (action.equals("create")) {
				// Create new record
				Administrador.getInstance().crearHabilitacion(h);
				// Convert Java Object to Json
				String json = gson.toJson(h);
				// Return Json in the format required by jTable plugin
				String listData = "{\"Result\":\"OK\",\"Record\":"
						+ json + "}";
				response.getWriter().print(listData);
			} else if (action.equals("update")) {
				// Update existing record
				Administrador.getInstance().modificarHabilitacion(h);

				// Convert Java Object to Json
				String json = gson.toJson(h);
				String listData = "{\"Result\":\"OK\",\"Record\":"
						+ json + "}";
				response.getWriter().print(listData);
			}
		} catch (Exception e) {
			String error = "{\"Result\":\"ERROR\",\"Message\":"
					+ "Exception in creating records }";
			response.getWriter().print(error);
			System.err.println(e.getMessage());
		}

	} else if (action.equals("delete")) {
		try {
			// Delete record
			if (request.getParameter("idDireccion") != null) {
				String dniHabilitado =request.getParameter("idDireccion");
				HabilitadoDTO hab=new HabilitadoDTO();
				hab.setDniHabilitado(dniHabilitado);
				Administrador.getInstance().eliminarHabilitacion(hab);
				String listData = "{\"Result\":\"OK\"}";
				response.getWriter().print(listData);
			}
		} catch (Exception e) {
			String error = "{\"Result\":\"ERROR\",\"Message\":"
					+" Exception in deleting records }";
			response.getWriter().print(error);
			System.err.println(e.getMessage());
		}
	}
}
}
}