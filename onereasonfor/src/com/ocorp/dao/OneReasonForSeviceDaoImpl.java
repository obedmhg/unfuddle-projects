package com.ocorp.dao;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.ocorp.jdo.Category;
import com.ocorp.jdo.OneReasonFor;
import com.ocorp.jdo.PMF;
import com.ocorp.jdo.User;

public class OneReasonForSeviceDaoImpl implements OneReasonForDao {

	 private PersistenceManager pm;
	
	@Override
	public void backUpOneReasonFor() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean createOneReasonFor(OneReasonFor oneR4) {
		boolean response = false;
		try {
			getPm().makePersistent(oneR4);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	@Override
	public boolean deleteOneReasonFor(OneReasonFor oneR4) {
		boolean response = false;
		try {
			getPm().deletePersistent(oneR4);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	@Override
	public List<OneReasonFor> getOneReasonFor(Date date) {
		List<OneReasonFor> reasons = null;
		try {
			String query = "select from " + OneReasonFor.class.getName() + " where creationDate <= cDate " 
															+ "PARAMETERS  java.util.Date cDate";
			reasons = (List<OneReasonFor>) getPm().newQuery(query).execute(date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reasons;
	}

	@Override
	public List<OneReasonFor> getOneReasonFor(Category category) {
		
		return null;
	}

	@Override
	public List<OneReasonFor> getOneReasonFor(String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OneReasonFor> getOneReasonFor(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OneReasonFor> getTopOneReasonFor() {
		String query = "select from " + OneReasonFor.class.getName() ;
        List<OneReasonFor> reasons = (List<OneReasonFor>) getPm().newQuery(query).execute();
        System.out.println(reasons);
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
	
	public void purgeOR4s(){
		for(OneReasonFor or4 : getTopOneReasonFor()){
			deleteOneReasonFor(or4);
		}
	}

}
