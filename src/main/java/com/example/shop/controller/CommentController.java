package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.shop.model.Comment;
import com.example.shop.security.UserDetail;
import com.example.shop.service.CommentService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService cSvc;
	
	@RequestMapping("/pagination")
	public int pagination(@RequestParam("productId") int productId) {
		int count = cSvc.productCommentListCount(productId);
		return count;
	}
	
	@RequestMapping("/ratingMean")
	public double ratingMean(@RequestParam("productId") int productId) {
		List<Comment> commentTotal = cSvc.productRatingMean(productId);
		int sum = 0;
		for (Comment comment : commentTotal) {
			sum += comment.getRating();
		}
		double ratingMean = sum*1.0/commentTotal.size();
		return ratingMean;
	}
	
	
	@RequestMapping("/{page}")
	public String productCommentList(
			@RequestParam("productId") int productId,
			@PathVariable("page") int page) {
		page = (page-1)*5;
		List<Comment> productCommentList = cSvc.productCommentList(productId,page);
		for (Comment comment : productCommentList) {
			if(comment.getEmail()==null) {
				comment.setEmail("(탈퇴한 회원입니다)");
			}
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		String listToJson = gson.toJson(productCommentList);
		
		return listToJson;
	}
	
	@RequestMapping("/reply")
	public String productReplyList(@RequestParam("commentId") int commentId) {
		List<Comment> productReplyList = cSvc.productReplyList(commentId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		String listToJson = gson.toJson(productReplyList);
		
		return listToJson;
	}
	
	@RequestMapping("/write")
	public String commentWrite(@AuthenticationPrincipal UserDetail userDetail, Comment comment) {
		comment.setInsId(userDetail.getUser().getId());
		
		String result = cSvc.commentWrite(comment);
		return result;
	}
	
	@RequestMapping("/delete")
	public String commentDelete(@AuthenticationPrincipal UserDetail userDetail, Comment comment) {
		comment.setDelId(userDetail.getUser().getId());
		
		String result = cSvc.commentDelete(comment);
		return result;
	}
}