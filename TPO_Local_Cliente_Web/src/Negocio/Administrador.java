package Negocio;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import dto.*;
import rmi.*;

public class Administrador {
	private RemoteInterface ir;
	private static final Administrador instancia = new Administrador();
	public static Administrador getInstance() {
		return instancia;
	}
	private Administrador()
	{
		try {
			ir = (RemoteInterface) Naming.lookup("//localhost/tpo");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}
	public  List<ClienteDTO> listarClientes() {
		
		try {
			return ir.obtenerClientes();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	public  List<EmpresaDTO> listarClientesEmpresa() {
			
			try {
				return ir.obtenerClientesEmpresa();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
			return null;
		}
	public  List<ParticularDTO> listarClientesParticular() {
		
		try {
			return ir.obtenerClientesParticular();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void altaCliente(ClienteDTO clienteDto){
		try{
			ir.altaCliente(clienteDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
		
	}
	public List<ClienteDTO> obtenerClientes(){
		try{
			return ir.obtenerClientes();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	public List<PedidoDTO> obtenerPedidos(){
		try{
			return ir.obtenerPedidos();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	public void altaClienteEmpresa(EmpresaDTO empresaDto){
		try{
			ir.altaClienteEmpresa(empresaDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void altaClienteParticular(ParticularDTO particularDto){
		try{
			ir.altaClienteParticular(particularDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void controlarEstadoEnvios(){
		try{
			ir.controlarEstadoDeEnvios();
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void cargarDatosIniciales(){
		try{
			ir.cargarDatosIniciales();
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void updateClienteEmpresa(EmpresaDTO empresaDto){
		try{
			ir.updateClienteEmpresa(empresaDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void updateClienteParticular(ParticularDTO particularDto){
		try{
			ir.updateClienteParticular(particularDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void deleteClienteEmpresa(int idCliente){
		try{
			ir.deleteClienteEmpresa(idCliente);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void deleteClienteParticular(int  idCliente){
		try{
			ir.deleteClienteParticular(idCliente);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	
	// Sucursales
	
	public  List<SucursalDTO> listarSucursales() {
		try {
			return ir.obtenerSucursales();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void altaSucursal(SucursalDTO sucursalDto){
		try{
			ir.altaSucursal(sucursalDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void updateSucursal(SucursalDTO sucursalDto){
		try{
			ir.updateSucursal(sucursalDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void deleteSucursal(int idSucursal){
		try{
			ir.deleteSucursal(idSucursal);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	// Trayectos
	
	public  List<TrayectoDTO> listarTrayectos() {
		try {
			return ir.obtenerTrayectos();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void altaTrayecto(TrayectoDTO trayectoDto){
		try{
			ir.altaTrayecto(trayectoDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void updateTrayecto(TrayectoDTO trayectoDto){
		try{
			ir.updateTrayecto(trayectoDto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	public void deleteTrayecto(int idTrayecto){
		try{
			ir.deleteTrayecto(idTrayecto);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	// Rutas
	
		// TODO Mirar Mapa de Rutas
		public  List<RutaDTO> listarRutas() {
			try {
				return ir.obtenerRutas();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public void altaRuta(RutaDTO rutaDTO){
			try{
				ir.altaRuta(rutaDTO);
			}catch (RemoteException e){
				e.printStackTrace();
			}
		}
		
		public void updateRuta(RutaDTO rutaDTO){
			try{
				ir.updateRuta(rutaDTO);
			}catch (RemoteException e){
				e.printStackTrace();
			}
		}
		
		public void deleteRuta(int idRuta){
			try{
				ir.deleteRuta(idRuta);
			}catch (RemoteException e){
				e.printStackTrace();
			}
		}
	
	//Carga
		
	public void createCarga(CargaDTO c){
		try{
			ir.createCarga(c);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void updateCarga(CargaDTO c){
		try{
			ir.updateCarga(c);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void deleteCarga(int idCarga){
		try{
			ir.deleteCarga(idCarga);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public List<CargaDTO> listarCargas(){
		try{
			return ir.listarCargas();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	public List<CargaDTO> listarCargasSinDespachar(){
		try{
			return ir.listarCargasSinDespachar();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	
	//Pedido
	
	public void crearPedido(PedidoDTO p){
		try{
			ir.crearPedido(p);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	
	//Carga
	public CargaDTO buscarCargaPorId(int idCarga){
		try{
			return ir.buscarCargaPorId(idCarga);
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	//Vehículos
	public List<VehiculoDTO> listarVehiculos(){
		try{
			return ir.obtenerVehiculos();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	public void crearVehiculo(VehiculoDTO v){
		try{
			ir.crearVehiculo(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void modificarVehiculo(VehiculoDTO v){
		try{
			ir.modificarVehiculo(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void eliminarVehiculo(VehiculoDTO v){
		try{
			ir.eliminarVehiculo(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	//Direcciones
	
	public List<DireccionDTO> listarDirecciones(){
		try{
			return ir.listarDirecciones();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	public void crearDireccion(DireccionDTO v){
		try{
			ir.crearDireccion(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void modificarDireccion(DireccionDTO v){
		try{
			ir.modificarDireccion(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}
	public void eliminarDireccion(DireccionDTO v){
		try{
			ir.eliminarDireccion(v);
		}catch (RemoteException e){
			e.printStackTrace();
		}
	}

	//Envío
	public List<EnvioDTO> listarEnvios(){
		try{
			return ir.listarEnvios();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	//Viaje
		public List<ViajeDTO> listarViajes(){
			try{
				return ir.listarViajes();
			}catch (RemoteException e){
				e.printStackTrace();
			}
			return null;
		}
		
	//Plan de mantenimiento
	public List<PlanDeMantenimientoDTO> listarPlanDeMantenimiento() {
		try {
			return ir.listarPlanesDeMantenimiento();
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void altaPlanDeMantenimiento(PlanDeMantenimientoDTO plan) {
		try {
			ir.altaPlanMantenimiento(plan);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePlanDeMantenimiento(PlanDeMantenimientoDTO plan) {
		try {
			ir.updatePlanDeMantenimiento(plan);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public void deletePlanDeMantenimiento(int idPlan) {
		try {
			ir.deletePlanDeMantenimiento(idPlan);
		}catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Obtiene los vehiculos que deben ser enviados a mantenimiento
	 * 
	 * @return la lista de vehiculos
	 */
	public List<VehiculoAMantenerDTO> getVehiculosMantenimiento() {
		try {
			return ir.getVehiculosAMantener();
		}catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
}
