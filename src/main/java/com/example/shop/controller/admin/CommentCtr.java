package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Comment;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.CommentSvc;
import com.example.shop.utils.Script;

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
	public @ResponseBody Map<String, Object> commentList() {
		List<Comment> commentList = commentSvc.commentList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", commentList);
		
		return map;
	}
	
	@GetMapping("/view/{id}")
	public String commentView(@PathVariable int id, Model model) {
		Comment comment = commentSvc.commentView(id);
		
		model.addAttribute("comment", comment);
		model.addAttribute("type", "comment");
		
		return "/admin/boardView";
	}
	
	@PostMapping("/write")
	public @ResponseBody String commentWrite(@AuthenticationPrincipal UserDetail userDetail, Comment comment) {
		comment.setInsId(userDetail.getUser().getId());
		String result = commentSvc.commentWrite(comment);
		
		if(result.equals("success")) {
			return Script.hrefWithMsg("답글을 저장하였습니다.", "/admin/comment/view/"+comment.getParentId());
		}else {
			return Script.back("답글 작성에 실패하였습니다. 다시 시도해 주세요.");
		}
	}
	
	@PostMapping("/delete/{id}")
	public @ResponseBody Map<String, Object> commentDelete(@AuthenticationPrincipal UserDetail userDetail, @PathVariable int id) {
		Comment comment = new Comment();
		comment.setId(id);
		comment.setDelId(userDetail.getUser().getId());
		
		String result = commentSvc.commentDelete(comment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
}
