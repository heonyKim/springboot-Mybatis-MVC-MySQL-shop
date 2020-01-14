package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.shop.model.Product;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.ProductSvc;

@Controller
@RequestMapping("/admin/product")
public class ProductCtr {
	
	@Autowired
	private ProductSvc productSvc;
	
	@GetMapping("")
	public String productPathRedirect() {
		return "redirect:/admin/product/";
	}
	
	@GetMapping("/")
	public String product() {
		return "/admin/product";
	}
	
	@GetMapping("/list")
	public @ResponseBody Map<String, Object> productList() {
		List<Product> productList = productSvc.productList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", productList);
		
		return map;
	}
	
	@PostMapping("/insert")
	public @ResponseBody Map<String, Object> productInsert(@AuthenticationPrincipal UserDetail userDetail, Product product) {
		product.setInsId(userDetail.getUser().getId());
		product.setUpdId(userDetail.getUser().getId());
		String result = productSvc.productInsert(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
	@PostMapping("/update")
	public @ResponseBody Map<String, Object> productUpdate(@AuthenticationPrincipal UserDetail userDetail, Product product) {
		product.setUpdId(userDetail.getUser().getId());
		String result = productSvc.productUpdate(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
	@PostMapping("/delete")
	public @ResponseBody Map<String, Object> productDelete(@AuthenticationPrincipal UserDetail userDetail, Product product) {
		product.setDelId(userDetail.getUser().getId());
		String result = productSvc.productDelete(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
	@PostMapping("/upload")
	public @ResponseBody Map<String, Object> productUpload(@RequestParam("productFile") MultipartFile file) throws Throwable {
		String result = productSvc.productUpload(file);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
}