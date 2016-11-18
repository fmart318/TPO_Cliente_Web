package servlet;

import java.io.IOException;
import java.sql.Date;
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
import dto.ParticularDTO;
import dto.PedidoDTO;


public class NuevoPedido extends HttpServlet {
private static final long serialVersionUID = 1L;


public NuevoPedido() {
}

protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
}

protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {

String action = request.getParameter("action");
Gson gson = new Gson();
response.setContentType("application/json");
			PedidoDTO p=new PedidoDTO();
			ClienteDTO c=new ClienteDTO();
			DireccionDTO dC=new DireccionDTO();
			DireccionDTO dD=new DireccionDTO();
			CargaDTO carga=new CargaDTO();
			carga.setIdCarga(1);
			CargaDTO carga2=new CargaDTO();
			carga2.setIdCarga(2);
			ArrayList<CargaDTO> cargas=new ArrayList<CargaDTO>();
			cargas.add(carga);
			cargas.add(carga2);
			p.setCargas(cargas);
			
			if (request.getParameter("idCliente") != null) {
			int idCliente = Integer.parseInt(request.getParameter("idCliente"));
			c.setIdCliente(idCliente);
			
			}
			if (request.getParameter("calle") != null) {
				String calle =request.getParameter("calle");
				dC.setCalle(calle);
			}
			if (request.getParameter("numero") != null) {
				int numero = Integer.parseInt(request.getParameter("numero"));
				dC.setNumero(numero);
			}
			if (request.getParameter("piso") != null) {
				int piso = Integer.parseInt(request.getParameter("piso"));
				dC.setPiso(piso);
			}
			if (request.getParameter("depto") != null) {
				String depto =request.getParameter("depto");
				dC.setDepartamento(depto);
			}
			if (request.getParameter("cp") != null) {
				String cp = request.getParameter("cp");
				dC.setCP(cp);
			}
			
			if (request.getParameter("calle2") != null) {
				String calle =request.getParameter("calle2");
				dD.setCalle(calle);
			}
			if (request.getParameter("numero2") != null) {
				int numero = Integer.parseInt(request.getParameter("numero2"));
				dD.setNumero(numero);
			}
			if (request.getParameter("piso2") != null) {
				int piso = Integer.parseInt(request.getParameter("piso2"));
				dD.setPiso(piso);
			}
			if (request.getParameter("depto2") != null) {
				String depto =request.getParameter("depto2");
				dD.setDepartamento(depto);
			}
			if (request.getParameter("cp2") != null) {
				String cp = request.getParameter("cp2");
				dD.setCP(cp);
			}
			
			if (request.getParameter("fechaCarga") != null) {
				Date fechaCarga = java.sql.Date.valueOf(request.getParameter("fechaCarga"));
				p.setFechaCarga(fechaCarga);
			}
			if (request.getParameter("horaInicio") != null) {
				int horaInicio = Integer.valueOf(request.getParameter("horaInicio"));
				p.getHoraInicio();
			}
			if (request.getParameter("horaFin") != null) {
				int horaFin = Integer.valueOf(request.getParameter("horaFin"));
				p.getHoraInicio();
			}
			if (request.getParameter("fechaMaxima") != null) {
				Date fechaMaxima = java.sql.Date.valueOf(request.getParameter("fechaMaxima"));
				p.setFechaMaxima(fechaMaxima);
			}
			if (request.getParameter("precio") != null) {
				int precio = Integer.valueOf(request.getParameter("precio"));
				p.setPrecio(precio);
			}
			if (request.getParameter("sucursalOrigen") != null) {
				String sucursalOrigen =request.getParameter("sucursalOrigen");
				p.setSucursalOrigen(sucursalOrigen);
			}
			if (request.getParameter("sucursalDestino") != null) {
				String sucursalDestino =request.getParameter("sucursalDestino");
				p.setSucursalDestino(sucursalDestino);
			}
			if (request.getParameter("solicitaTransporteDirecto") != null) {
				String solicitaTransporteDirecto =request.getParameter("solicitaTransporteDirecto");
				boolean b=false;
				if(solicitaTransporteDirecto.equals("true"))
					b=true;
				p.setSolicitaTransporteDirecto(b);
			}
			if (request.getParameter("solicitaAvionetaParticular") != null) {
				String solicitaAvionetaParticular =request.getParameter("solicitaAvionetaParticular");
				boolean b=false;
				if(solicitaAvionetaParticular.equals("true"))
					b=true;
				p.setSolicitaAvionetaParticular(b);
			}
			p.setCliente(c);
			p.setDireccionCarga(dC);
			p.setDireccionDestino(dD);
			Administrador.getInstance().crearPedido(p);
			

}
}