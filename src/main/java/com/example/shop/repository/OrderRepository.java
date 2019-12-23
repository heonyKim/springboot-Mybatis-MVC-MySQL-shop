package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Order;

public interface OrderRepository {
	//ADMIN
	List<Order> orderList();
	List<Order> orderView(String orderNo);
	int orderUpdate(Order order);
	
	//USER
}
