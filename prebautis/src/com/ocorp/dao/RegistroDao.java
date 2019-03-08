package com.ocorp.dao;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.ocorp.jdo.PMF;
import com.ocorp.jdo.Registro;


public class RegistroDao {
	
	 private PersistenceManager pm;

	public boolean createRegistro(Registro registro) {
		boolean response = false;
		try {
			getPm().makePersistent(registro);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	public boolean deleteRegistro(Registro registro) {
		boolean response = false;
		try {
			getPm().deletePersistent(registro);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}
	
	public List<Registro> getAllRegistro() {
		String query = "select from " + Registro.class.getName() ;
        List<Registro> reasons = (List<Registro>) getPm().newQuery(query).execute();
		return reasons;
	}
	
	public List<Registro> getRegistro(String password) {
		List<Registro> reasons = null;
		try {
			String query = "select from " + Registro.class.getName() + " where nombre == cPassword " 
															+ "PARAMETERS  java.lang.String cPassword";
			reasons = (List<Registro>) getPm().newQuery(query).execute(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reasons;
	}

	/**
	 * Getter of PersistenceManager
	 * @return
	 */
	public PersistenceManager getPm() {
		if(pm == null || pm.isClosed()){
			pm = PMF.get().getPersistenceManager();
		}
		return pm;
	}
	
}
