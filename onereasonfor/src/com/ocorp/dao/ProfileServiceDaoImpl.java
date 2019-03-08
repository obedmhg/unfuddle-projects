package com.ocorp.dao;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.ocorp.jdo.PMF;
import com.ocorp.jdo.User;

public class ProfileServiceDaoImpl implements ProfileDao {

	 private PersistenceManager pm;
	 private DatastoreService datastore;

	
	/**
	 * TODO
	 */
	 @Override
	 public void backUpUsers() {
		// TODO Auto-generated method stub
	}
	 /**
	  * Method to create a user
	  */
	@Override
	public boolean createUser(User user) {
		boolean response = false;
		try {
			getPm().makePersistent(user);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	/**
	 * Method to delete a user
	 */
	@Override
	public boolean deleteUser(User user) {
		boolean response = false;
		try {
			getPm().deletePersistent(user);
			response = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			getPm().close();
		}
		return response;
	}

	/**
	 * Method to get a user
	 */
	@Override
	public User getUser(String userName, String password) {
		User user = null;
		Query query = getPm().newQuery(User.class);
	    query.setFilter("loginName == pLoginName && password == pPassword");
	    query.declareParameters("String pLoginName, String pPassword");
	    List<User> results = (List<User>) query.execute(userName, password);
	    if(results!= null) {
	    	user = results.get(0);
	    }
		return user;
	}

	/**
	 * TODO
	 */
	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
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

	/**
	 * getter of DatastoreService
	 * @return
	 */
	public DatastoreService getDatastore() {
		if(datastore == null){
			datastore = DatastoreServiceFactory.getDatastoreService();
		}
		return datastore;
	}

}
