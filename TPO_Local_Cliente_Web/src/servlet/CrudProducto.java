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
import dto.ProductoDTO;


public class CrudProducto extends HttpServlet {
private static final long serialVersionUID = 1L;


public CrudProducto() {
}

protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
}

protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {

String action = request.getParameter("action");

List<ProductoDTO> list = Administrador.getInstance().listarProductos();
Gson gson = new Gson();
response.setContentType("application/json");

if (action != null) {
	if (action.equals("list")) {
	try {
		// Convert Java Object to Json
		JsonElement element = gson.toJsonTree(list,
				new TypeToken<List<ProductoDTO>>() {}.getType());
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
		ProductoDTO h=new ProductoDTO();
		if (request.getParameter("idProducto") != null) {
		int idProducto = Integer.valueOf(request.getParameter("idProducto"));
		h.setIdProducto(idProducto);
		}
		if (request.getParameter("nombre") != null) {
			String nombre = request.getParameter("nombre");
			h.setNombre(nombre);
		}if (request.getParameter("tipo") != null) {
			String tipo = request.getParameter("tipo");
			h.setTipo(tipo);
		}
		
	
		try {
			if (action.equals("create")) {
				// Create new record
				Administrador.getInstance().crearProductos(h);
				// Convert Java Object to Json
				String json = gson.toJson(h);
				// Return Json in the format required by jTable plugin
				String listData = "{\"Result\":\"OK\",\"Record\":"
						+ json + "}";
				response.getWriter().print(listData);
			} else if (action.equals("update")) {
				// Update existing record
				Administrador.getInstance().modificarProducto(h);

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
				int idProducto =Integer.valueOf(request.getParameter("idDireccion"));
				ProductoDTO h=new ProductoDTO();
				h.setIdProducto(idProducto);
				Administrador.getInstance().eliminarProducto(h);
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