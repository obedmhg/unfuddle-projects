package com.ocorp.dao;

import java.util.Date;
import java.util.List;

import com.ocorp.jdo.Category;
import com.ocorp.jdo.OneReasonFor;
import com.ocorp.jdo.User;

public interface OneReasonForDao {

	public boolean createOneReasonFor(OneReasonFor oneR4);
	
	public boolean deleteOneReasonFor(OneReasonFor oneR4);
	
	public List<OneReasonFor> getOneReasonFor(Date date);
	
	public List<OneReasonFor> getOneReasonFor(Category category);
	
	public List<OneReasonFor> getTopOneReasonFor();
	
	public List<OneReasonFor> getOneReasonFor(String query);
	
	public List<OneReasonFor> getOneReasonFor(User user);
	
	public void backUpOneReasonFor();
}
