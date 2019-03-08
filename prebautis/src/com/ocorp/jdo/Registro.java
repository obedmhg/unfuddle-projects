package com.ocorp.jdo;

import com.google.appengine.api.datastore.Key;

import java.io.Serializable;
public class Registro implements Serializable  {

	private static final long serialVersionUID = 7787964619250045839L;

	private Key key;

	private String parroquia;
	
	private String fecha;
	
	private String folio;
	
	private String nombre;
	
	private String parentesco;
	
	private String estadoCivil;
	
	private String tipo;

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	public String getParroquia() {
		return parroquia;
	}

	public void setParroquia(String parroquia) {
		this.parroquia = parroquia;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getFolio() {
		return folio;
	}

	public void setFolio(String folio) {
		this.folio = folio;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getParentesco() {
		return parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return "Fecha: " + this.getFecha() + "\n" +
				"Nombre: " + this.getNombre() + "\n" +
				"Folio: " + this.getFolio() + "\n" +
				"Parentesco: " + this.getParentesco() + "\n" +
				"Tipo: " + this.getTipo() + "\n";
	}
	
}
