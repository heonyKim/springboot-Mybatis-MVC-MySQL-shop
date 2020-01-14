package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.shop.model.Product;
import com.example.shop.service.SaleService;

@Controller
@RequestMapping("/sale")
public class SaleController {

	@Autowired
	private SaleService saleSvc;
	
	@GetMapping("/list")
	public String saleList(Model model) {
		List<Product> saleList = saleSvc.saleList();
		
		model.addAttribute("saleList",saleList);
		return "/sale/list";
	}
}