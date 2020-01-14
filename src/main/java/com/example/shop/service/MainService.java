package com.example.shop.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Code;
import com.example.shop.model.Product;
import com.example.shop.repository.CodeRepository;
import com.example.shop.repository.ProductRepository;

@Service
public class MainService {

	@Autowired
	private CodeRepository cRepo;
	
	@Autowired
	private ProductRepository pRepo;
	
	public List<Product> productList() {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> listAll = pRepo.findAll(today);
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
				}else {
					double salePer = (100-product.getAmount())*0.01;
					int salePrice = (int)(product.getPrice()*salePer);
					product.setSalePrice(salePrice);
				}
			}
		}
		
		return listAll;
	}
	
	public List<Product> bestProductList(){
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
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
		
		return best;
	}
	
	public List<Code> category(){
		return cRepo.productCode();
	}
}