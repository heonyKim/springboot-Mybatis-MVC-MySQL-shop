package com.example.shop.controller;

import java.text.SimpleDateFormat;
import java.util.List;

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
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		Product product = pRepo.productView(id,today);
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
		model.addAttribute("product",product);
		return "/product";
	}
	
	@GetMapping("/list/{cd}")
	public String productView(@PathVariable int cd, Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> list=pRepo.productCategoryList(today, cd);
		
		for (Product product : list) {
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
		model.addAttribute("list",list);
		return "/product/list";
	}
	
	
	
	
}
