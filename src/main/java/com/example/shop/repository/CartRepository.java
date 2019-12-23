package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Cart;

public interface CartRepository {
	int save(Cart cart);
	int delete(int id);
	List<Cart> findAll(int insId);
}
