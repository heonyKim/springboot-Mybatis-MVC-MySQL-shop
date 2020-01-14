package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Comment;
import com.example.shop.repository.CommentRepository;

@Service
public class CommentSvc {

	@Autowired
	private CommentRepository commentRep;
	
	public List<Comment> commentList(){
		return commentRep.commentList();
	}
	
	public Comment commentView(int id) {
		return commentRep.commentView(id);
	}
	
	public String commentWrite(Comment comment) {
		String resultStr = "";
		
		try {
			int result = commentRep.commentWrite(comment);
			
			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultStr ="fail";
		}
		
		return resultStr;
	}
	
	public String commentDelete(Comment comment) {
		String resultStr = "";
		
		try {
			int result = commentRep.commentDelete(comment);

			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			resultStr ="fail";
			e.printStackTrace();
		}
		
		return resultStr;
	}
}