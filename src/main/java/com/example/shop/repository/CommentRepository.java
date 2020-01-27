package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Comment;

public interface CommentRepository {
	//ADMIN
	List<Comment> commentList();
	Comment commentView(int id);
	int commentWrite(Comment comment);
	int commentDelete(Comment comment);
	
	//USER
	List<Comment> productUserCommentList(int productId,int page);
	List<Comment> productUserCommentListCount(int productId);
	List<Comment> productAdminReplyList(int commentId);
}