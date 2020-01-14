package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.User;
import com.example.shop.service.admin.UserSvc;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/user")
public class UserCtr {
	
	@Autowired
	private UserSvc userSvc;
	
	@GetMapping("")
	public String userPathRedirect() {
		return "redirect:/admin/user/";
	}
	
	@GetMapping("/")
	public String user(Model model) {
		return "/admin/user";
	}
	
	@GetMapping("/check")
	public @ResponseBody Map<String, Object> userCheck() {
		int result = userSvc.userCheck();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", result);
		
		return map;
	}
	
	@GetMapping("/list")
	public @ResponseBody String userList() {
		List<User> user = userSvc.userList();
		
		Gson gson = new Gson();
		String userToJson = gson.toJson(user);
		
		userToJson = "{\"data\":"+userToJson+"}";
		return userToJson;
	}
	
	@PostMapping("/delete")
	public @ResponseBody Map<String, Object> userDelete(){
		String result = userSvc.userDelete();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", result);
		
		return map;
	}
}