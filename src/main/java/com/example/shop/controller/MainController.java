package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Code;
import com.example.shop.model.Product;
import com.example.shop.repository.CodeRepository;
import com.example.shop.repository.ProductRepository;
import com.google.gson.Gson;

@Controller
public class MainController {
	
	@Autowired
	private CodeRepository cRepo;
	
	@Autowired
	private ProductRepository pRepo;
	
	@GetMapping("")
	public String redirect() {
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String home(Model model) {
		
		List<Product> best = pRepo.productBest3(); 
		List<Product> listAll=pRepo.productList();
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
		
		List<Code> category = cRepo.productCode();
		Gson gson = new Gson();
		String toJson = gson.toJson(category);
		return toJson;
	}
	
	
}
