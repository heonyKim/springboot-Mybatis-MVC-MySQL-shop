package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Coupon;
import com.example.shop.model.Order;
import com.example.shop.model.Sale;

public interface OrderRepository {
	//ADMIN
	List<Order> orderList();
	List<Order> orderView(String orderNo);
	int orderUpdate(Order order);
	
	//USER
	List<Order> orderCartList(int id);
	List<Sale> orderSaleList(int id);
	Coupon orderCoupon(String code);
	String orderCheck(String today);
	int orderInsert(Order order);
	int orderUpdatePayment(Order order);
	int orderCartDelete(int id);
	List<Order> orderResultView(String orderNo);
	List<Order> orderListAll(int id);
	List<Order> orderListDetail(String orderNo);
}