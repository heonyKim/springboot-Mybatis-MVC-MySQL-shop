package com.example.shop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Coupon;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.CouponSvc;
import com.example.shop.utils.Script;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/coupon")
public class CouponCtr {
	
	@Autowired
	private CouponSvc couponSvc;
	
	@GetMapping("")
	public String couponPathRedirect() {
		return "redirect:/admin/coupon/";
	}
	
	@GetMapping("/")
	public String coupon() {
		return "/admin/coupon";
	}
	
	@RequestMapping("/list")
	public @ResponseBody String couponList() {
		List<Coupon> couponList = couponSvc.couponList();
		
		Gson gson = new Gson();
		String listToJson = gson.toJson(couponList);

		listToJson = "{\"data\":" + listToJson + "}";
		return listToJson;
	}
	
	@RequestMapping("/insert")
	public @ResponseBody String couponInsert(@AuthenticationPrincipal UserDetail userDetail, Coupon coupon, Model model) {
		coupon.setInsId(userDetail.getUser().getId());
		coupon.setUpdId(userDetail.getUser().getId());
		int result = couponSvc.couponInsert(coupon);
		
		if(result==1) {
			model.addAttribute("coupon",coupon);
			return model.toString();
		}else {
			return Script.back("저장실패");
		}
	}
	
	@PostMapping("/update")
	public @ResponseBody String couponUpdate(@AuthenticationPrincipal UserDetail userDetail, Coupon coupon, Model model) {
		coupon.setUpdId(userDetail.getUser().getId());
		int result = couponSvc.couponUpdate(coupon);
		
		if(result==1) {
			model.addAttribute("coupon",coupon);
			return model.toString();
		}else {
			return Script.back("수정실패");
		}
	}
}