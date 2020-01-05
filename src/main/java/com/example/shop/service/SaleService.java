package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Product;
import com.example.shop.repository.SaleRepository;

@Service
public class SaleService {
	
	@Autowired
	private SaleRepository sRepo;
	
	public List<Product> saleList(String today){
		List<Product> saleList=sRepo.saleList(today);
		return saleList;
	}
}
