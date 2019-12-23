package com.example.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.shop.model.Product;
import com.example.shop.repository.ProductRepository;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductRepository pRepo;
	
	@GetMapping("/{id}")
	public String productList(@PathVariable int id,Model model) {
		Product product = pRepo.productView(id);
		model.addAttribute("product",product);
		return "/product";
	}
	
	@GetMapping("/view/{Id}")
	public String productView(@PathVariable int id) {
		return "/product/view";
	}
	
	@GetMapping("/list/popular")	//rest
	public String productListPopular() {
		return "/product/list/popular";
	}
	@GetMapping("/list/latest")		//rest
	public String productListLatest() {
		return "/product/list/latest";
	}
	
	
	
	
}
