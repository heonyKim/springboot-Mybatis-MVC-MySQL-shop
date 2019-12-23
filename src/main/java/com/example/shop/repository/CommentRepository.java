package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Comment;

public interface CommentRepository {
	//ADMIN
	List<Comment> commentList();
	
	//USER
}
