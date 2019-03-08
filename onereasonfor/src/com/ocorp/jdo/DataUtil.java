package com.ocorp.jdo;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Transaction;

import com.google.appengine.api.datastore.Query;

public class DataUtil {
	PersistenceManager pm = PMF.get().getPersistenceManager();
	
	public void createCategory(){
        Category category = new Category();
        category.setCategoryName("Entertainment");
        category.setCategoryDescription("In this category you will find all the Entertainment!");
        try {
            pm.makePersistent(category);
            listCategories();
            deleteCategories();
            listCategories();
        } finally {
            pm.close();
        }	
	}
	
	private void deleteCategories(){
		Transaction tx = (Transaction) pm.currentTransaction();
		try {
			
			tx.begin();

			List<Category> categories = (List<Category>) pm.newQuery("SELECT FROM com.ocorp.jdo.Category ").execute();
			for(Category c: categories) {
				pm.deletePersistent(c);
			}
			tx.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			tx.rollback();
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void listCategories(){
		List<Category> categories = (List<Category>) pm.newQuery("SELECT FROM com.ocorp.jdo.Category ").execute();
		System.out.println("=Categories=");
		for(Category c: categories) {
			System.out.println(c.getKey() + c.getCategoryName());
		}
	}
	
}
