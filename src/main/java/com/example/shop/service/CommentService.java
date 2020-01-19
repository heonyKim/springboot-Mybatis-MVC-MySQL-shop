package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop.model.Comment;
import com.example.shop.repository.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRep;
	
	
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
	

	public int productUserCommentListCount(int productId) {
		List<Comment> comments = commentRep.productUserCommentListCount(productId);
		int pageMax = (int) Math.ceil(comments.size()/5.0);
		return pageMax;
	}
	
	
	public List<Comment> productCommentList(int productId,int page) {
		int range = (page-1)*5;
		List<Comment> productCommentList = commentRep.productUserCommentList(productId,range);
		return productCommentList;
	}
	
	public List<Comment> productReplyList(@RequestParam("commentId") int commentId) {
		List<Comment> productReplyList = commentRep.productAdminReplyList(commentId);
		return productReplyList;
	}
}