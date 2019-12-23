package com.example.shop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.shop.service.admin.CommentSvc;

@Controller
@RequestMapping("/admin/comment")
public class CommentCtr {

	@Autowired
	private CommentSvc commentSvc;
	
	@GetMapping("")
	public String commentPathRedirect() {
		return "redirect:/admin/comment/list";
	}
	
	@GetMapping("/list")
	public String commentList() {
		return "/admin/boardList";
	}
}
