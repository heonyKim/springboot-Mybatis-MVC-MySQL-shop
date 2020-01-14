package com.example.shop.controller.admin;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Product;
import com.example.shop.model.Sale;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.SaleSvc;
import com.example.shop.utils.Script;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/sale")
public class SaleCtr {
	
	@Autowired
	private SaleSvc saleSvc;
	
	@GetMapping("")
	public String salePathRedirect() {
		return "redirect:/admin/sale/";
	}

	@GetMapping("/")
	public String sale() {
		return "/admin/sale";
	}

	@RequestMapping("/list")
	public @ResponseBody String saleList() {
		List<Sale> saleList = saleSvc.saleList();

		Gson gson = new Gson();
		String listToJson = gson.toJson(saleList);

		listToJson = "{\"data\":" + listToJson + "}";
		return listToJson;
	}

	@RequestMapping("/load/product")
	public @ResponseBody String saleLoadProduct(@RequestParam("num") String num) {

		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> productList = saleSvc.saleLoadProduct(num, today);
		
		Gson gson = new Gson();
		String listToJson = gson.toJson(productList);

		return listToJson;
	}

	@RequestMapping("/insert")
	public @ResponseBody String saleInsert(@AuthenticationPrincipal UserDetail userDetail, Sale sale, Model model) {
		sale.setInsId(userDetail.getUser().getId());
		sale.setUpdId(userDetail.getUser().getId());
		int result = saleSvc.saleInsert(sale);
		
		if(result==1) {
			model.addAttribute("sale",sale);
			return model.toString();
		}else {
			return Script.back("저장실패");
		}
		
	}
	
	@PostMapping("/update")
	public @ResponseBody String saleUpdate(@AuthenticationPrincipal UserDetail userDetail, Sale sale, Model model) {
		sale.setUpdId(userDetail.getUser().getId());
		int result = saleSvc.saleUpdate(sale);
		
		if(result==1) {
			model.addAttribute("sale", sale);
			return model.toString();
		}else {
			return Script.back("수정실패");
		}
	}
}