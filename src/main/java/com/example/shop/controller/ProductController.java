package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Product;
import com.example.shop.security.UserDetail;
import com.example.shop.service.ProductService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService pSvc;
	
	@GetMapping("/{id}")
	public String productDetail(@PathVariable int id, 
			@AuthenticationPrincipal UserDetail user,
			Model model) {
		Product product = pSvc.productDetail(id);
		
		if(user!=null) {
			List<Product> commentQualifiedList = pSvc.commentQualified(id, user.getUser().getId()) ;
			if(commentQualifiedList.size()>0) {
				model.addAttribute("commentQualifiedFlag",1);
			}else {
				model.addAttribute("commentQualifiedFlag",0);
			}
		}else {
			model.addAttribute("commentQualifiedFlag",0);
		}
		model.addAttribute("product", product);
		return "/product/view";
	}
	
	@GetMapping("/list/{cd}")
	public String productList(@PathVariable String cd, Model model) {
		List<Product> list = pSvc.productList(cd);
		
		model.addAttribute("list",list);
		return "/product/list";
	}
	
	@RequestMapping("/main/list/{page}")
	public @ResponseBody String mainListLoad(@PathVariable int page) {
		List<Product> listAll = pSvc.mainListLoad(page);
		
		Gson gson = new Gson();
		String listToJson = gson.toJson(listAll);
		
		return listToJson;
	}
	
	@RequestMapping({"/category/list/{categoryCd}/{page}"})
	public @ResponseBody String categoryListLoad(@PathVariable("categoryCd") String categoryCd, @PathVariable("page") int page) {
		List<Product> listAll = pSvc.categoryListLoad(categoryCd, page);
		
		Gson gson = new Gson();
		String listToJson = gson.toJson(listAll);
		
		return listToJson;
	}
}