package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Cart;
import com.example.shop.repository.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cRepo;
	
	public int cartCount(int insId) {
		int result = cRepo.CountByid(insId);
		return result;
	}
	
	public int cartAdd(Cart cart) {
		int result = cRepo.save(cart);
		return result;
	}
	
	public List<Cart> cartList(int userId,String today) {
		return cRepo.findAll(userId,today);
	}
	
	public int cartDelete(int id) {
		return cRepo.delete(id);
	}
	
	public int cartUpdate(Cart cart) {
		return cRepo.update(cart);
	}
}