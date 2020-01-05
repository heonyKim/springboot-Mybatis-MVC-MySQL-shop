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
	List<Product> findAll(String today);
	List<Product> productBest3(String today);
	List<Product> productCategoryList(String today,int cd);
	Product productView(int id, String today);
	
}
