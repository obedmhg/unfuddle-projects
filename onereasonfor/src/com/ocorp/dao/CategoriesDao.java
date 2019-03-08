package com.ocorp.dao;

import java.util.List;

import com.ocorp.jdo.Category;

public interface CategoriesDao {
	
	public boolean createCategory(Category category);
	
	public List<Category> getCategories();
	
	public List<Category> getCategories(String category);
	
	public void backUpCategories();
}
