package com.example.shop.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Product;
import com.example.shop.repository.SaleRepository;

@Service
public class SaleService {
	
	@Autowired
	private SaleRepository sRepo;
	
	public List<Product> saleList(){
		SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd");
		String today = format.format(System.currentTimeMillis());
		
		List<Product> saleList = sRepo.saleList(today);
		for (Product product : saleList) {
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
		
		return saleList;
	}
}