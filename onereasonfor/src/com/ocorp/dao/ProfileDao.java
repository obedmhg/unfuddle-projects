package com.ocorp.dao;

import com.ocorp.jdo.User;

public interface ProfileDao {

	public boolean createUser(User user);
	
	public boolean updateUser(User user);
	
	public boolean deleteUser(User user);
	
	public User getUser(String userName, String password);
	
	public void backUpUsers();
	
}
