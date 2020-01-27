package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop.model.Comment;
import com.example.shop.repository.CommentRepository;
import com.example.shop.utils.Util;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRep;
	
	public String commentWrite(Comment comment) {
		String resultStr = "";
		
		try {
			comment.setContent(Util.replaceTag(comment.getContent()));
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
	
	public List<Comment> productCommentList(int productId,int page) {
		List<Comment> productCommentList = commentRep.productUserCommentList(productId,page);
		return productCommentList;
	}
	
	public int productCommentListCount(int productId) {
		List<Comment> productCommentListCount = commentRep.productUserCommentListCount(productId);
		return productCommentListCount.size();
	}
	
	public List<Comment> productRatingMean (int productId) {
		List<Comment> productCommentListCount = commentRep.productUserCommentListCount(productId);
		return productCommentListCount;
	}
	
	public List<Comment> productReplyList(@RequestParam("commentId") int commentId) {
		List<Comment> productReplyList = commentRep.productAdminReplyList(commentId);
		return productReplyList;
	}
}