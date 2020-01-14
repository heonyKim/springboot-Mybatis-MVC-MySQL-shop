package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Coupon;
import com.example.shop.repository.CouponRepository;

@Service
public class CouponSvc {
	
	@Autowired
	private CouponRepository couponRep;
	
	public List<Coupon> couponList() {
		return couponRep.findAll();
	}
	
	public int couponInsert(Coupon coupon) {
		return couponRep.save(coupon);
	}
	
	public int couponUpdate(Coupon coupon) {
		return couponRep.update(coupon);
	}
	
	public @ResponseBody Coupon cartCoupon(@RequestParam("couponCode") String code) {
		Coupon coupon = couponRep.findCoupon(code);
		return coupon;
	}
}