package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Code;
import com.example.shop.model.Product;
import com.example.shop.security.UserDetail;
import com.example.shop.service.MainService;
import com.google.gson.Gson;

@Controller
public class MainController {
	
	@Autowired
	private MainService mSvc;
	
	@GetMapping("")
	public String redirect() {
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String home(Model model, @AuthenticationPrincipal UserDetail user) {
		List<Product> listAll = mSvc.productList();
		List<Product> best = mSvc.bestProductList();
		
		model.addAttribute("best", best);
		model.addAttribute("listAll", listAll);
		return "/main";
	}
	
	@GetMapping("/empty")
	public String empty() {
		return "/empty";
	}
	
	@RequestMapping("/category")
	public @ResponseBody String category(Model model) {
		List<Code> category = mSvc.category();
		
		Gson gson = new Gson();
		String toJson = gson.toJson(category);
		
		return toJson;
	}
}