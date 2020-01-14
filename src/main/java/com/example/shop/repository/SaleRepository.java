package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Product;
import com.example.shop.model.Sale;

public interface SaleRepository {
	//ADMIN
	List<Sale> findAll();
	List<Product> findByProduct(String categoryCd,String today);
	int save(Sale sale);
	int update(Sale sale);
	
	//USER
	List<Product> saleList(String today);
}