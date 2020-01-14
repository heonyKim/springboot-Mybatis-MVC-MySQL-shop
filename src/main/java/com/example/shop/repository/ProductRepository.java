package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Product;

public interface ProductRepository {
	//ADMIN
	List<Product> productList();
	int productInsert(Product product);
	int productUpdate(Product product);
	int productDelete(Product product);
	
	//USER
	List<Product> findAll(String today);
	List<Product> mainListLoad(String today, int page);
	List<Product> productBest3(String today);
	List<Product> productCategoryList(String today,String cd);
	List<Product> productCategoryListLoad(String today,String cd,int page);
	Product productView(int id, String today);
	List<Product> commentQualified(int productId, int userId);
}