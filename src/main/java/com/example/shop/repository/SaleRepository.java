package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Product;
import com.example.shop.model.Sale;

public interface SaleRepository {
	//ADMIN
	List<Sale> findAll();
	List<Product> findByProduct(String categoryCd);
	//List<Code> findBycodeGbn();
	int save(Sale sale);
	int update(Sale sale);
	
	//USER
}