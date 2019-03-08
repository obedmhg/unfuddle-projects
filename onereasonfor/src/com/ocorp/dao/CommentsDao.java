package com.ocorp.dao;

import com.ocorp.jdo.Comment;

public interface CommentsDao {

	public boolean postComment(Comment comment);
	
	public void backUpComments();
	
}
