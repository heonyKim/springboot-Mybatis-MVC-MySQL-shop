package com.example.shop.controller;

import java.text.SimpleDateFormat;
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
import com.example.shop.repository.CodeRepository;
import com.example.shop.repository.ProductRepository;
import com.example.shop.security.UserDetail;
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
	public String home(Model model, @AuthenticationPrincipal UserDetail user) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> listAll=pRepo.findAll(today);
		for (Product product : listAll) {
			if(product.getSaleId()>0) {
				String endDate = product.getEndDate();
				String yyyy = endDate.substring(0,4);
				String mm = endDate.substring(4,6);
				String dd = endDate.substring(6);
				endDate = yyyy+"."+mm+"."+dd;
				product.setEndDate(endDate);
			
				if(product.getUnitCd().equals("01")) {
					int salePrice = product.getPrice()-product.getAmount();
					product.setSalePrice(salePrice);
				}else {	//unitCd().equals(02)
					double salePer = (100-product.getAmount())*0.01;
					int salePrice = (int)(product.getPrice()*salePer);
					product.setSalePrice(salePrice);
				}
			}
		}
		List<Product> best = pRepo.productBest3(today); 
		for (Product product : best) {
			if(product.getSaleId()>0) {
				String endDate = product.getEndDate();
				String yyyy = endDate.substring(0,4);
				String mm = endDate.substring(4,6);
				String dd = endDate.substring(6);
				endDate = yyyy+"."+mm+"."+dd;
				product.setEndDate(endDate);
			
				if(product.getUnitCd().equals("01")) {
					int salePrice = product.getPrice()-product.getAmount();
					product.setSalePrice(salePrice);
				}else {	//unitCd().equals(02)
					double salePer = (100-product.getAmount())*0.01;
					int salePrice = (int)(product.getPrice()*salePer);
					product.setSalePrice(salePrice);
				}
			}
		}
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
