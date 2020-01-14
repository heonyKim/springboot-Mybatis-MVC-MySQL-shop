package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Coupon;

public interface CouponRepository{
	//ADMIN
	List<Coupon> findAll();
	int save(Coupon coupon);
	int update(Coupon coupon);
	
	//USER
	Coupon findCoupon(String code);
}