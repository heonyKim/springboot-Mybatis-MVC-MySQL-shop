package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Product;

public interface ProductRepository {
	//ADMIN
	List<Product> productList();
	int productInsert(Product product);
	int productUpdate(Product product);
	int productDelete(Product product);
	
	//USER★★★★★★★★
	List<Product> productBest3();
	Product productView(int id);
}
