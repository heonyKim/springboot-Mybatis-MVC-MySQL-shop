package com.example.shop.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Product;
import com.example.shop.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository pRepo;
	
	public List<Product> commentQualified(int productId, int userId){
		List<Product> product = pRepo.commentQualified(productId, userId); 
		return product;
	}
	
	public Product productDetail(int id) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		Product product = pRepo.productView(id, today);
		
		if(product.getDelDt()!=null) {
			product.setFilePath("https://heonydesign.000webhostapp.com/shop/saleEnd.jpg");
			product.setDescription("판매가 중지되었거나 존재하지 않는 상품입니다.");
		} else {
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
		
		return product;
	}
	
	public List<Product> productList(String cd) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> list = pRepo.productCategoryList(today, cd);
		
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
				}else {
					double salePer = (100-product.getAmount())*0.01;
					int salePrice = (int)(product.getPrice()*salePer);
					product.setSalePrice(salePrice);
				}
			}
		}
		
		return list;
	}
	
	public List<Product> mainListLoad(int page) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> listAll = pRepo.mainListLoad(today, page);
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
	
	public List<Product> categoryListLoad(String categoryCd, int page) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
		String today = format1.format(System.currentTimeMillis());
		
		List<Product> listAll = pRepo.productCategoryListLoad(today, categoryCd, page);
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
}