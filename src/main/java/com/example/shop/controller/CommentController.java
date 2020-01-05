package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.shop.model.Comment;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.CommentSvc;
import com.google.gson.Gson;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentSvc cSvc;
	
	@RequestMapping("")
	public String productCommentList(@RequestParam("productId") int productId) {
		List<Comment> productCommentList = cSvc.productCommentList(productId);
		Gson gson = new Gson();
		String listToJson = gson.toJson(productCommentList);
		return listToJson;
	}
	
	@RequestMapping("/reply")
	public String productReplyList(@RequestParam("commentId") int commentId) {
		
		List<Comment> productReplyList = cSvc.productReplyList(commentId);
		Gson gson = new Gson();
		String listToJson = gson.toJson(productReplyList);
		return listToJson;
	}
	
	@RequestMapping("/write")
	public String commentWrite(
			@AuthenticationPrincipal UserDetail userDetail
			,Comment comment) {
		comment.setInsId(userDetail.getUser().getId());
		String result = cSvc.commentWrite(comment);
		return result;
	}
	
	@RequestMapping("/delete")
	public String commentDelete(
			@AuthenticationPrincipal UserDetail userDetail,
			Comment comment) {
		comment.setDelId(userDetail.getUser().getId());
		String result = cSvc.commentDelete(comment);
		return result;
	}
	
}
