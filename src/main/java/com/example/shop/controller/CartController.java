package com.example.shop.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Cart;
import com.example.shop.security.UserDetail;
import com.example.shop.service.CartService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartSvc;
	
	@RequestMapping("/count")
	public @ResponseBody String cartCount(@AuthenticationPrincipal UserDetail user) {
		int count = cartSvc.cartCount(user.getUser().getId());
		
		Gson gson = new Gson();
		String countToJson=gson.toJson(count);
		
		return countToJson;
	}
	
	@PostMapping("/add")
	public String cartAdd(Cart cart, Model model, @AuthenticationPrincipal UserDetail user) {
		int userId = user.getUser().getId();
		cart.setInsId(userId);
		
		cartSvc.cartAdd(cart);
		
		return "redirect:/cart/list";
	}
	
	@GetMapping("/list")
	public String cartList() {
		return "/cart/list";
	}
	
	@RequestMapping(value={"/cartList","/amountTotal"})
	public @ResponseBody String addedCartList(@AuthenticationPrincipal UserDetail user) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(System.currentTimeMillis());
		
		int userId = user.getUser().getId();
		
		List<Cart> list =cartSvc.cartList(userId, today);
		
		Gson gson = new Gson();
		String listToJson=gson.toJson(list);
		
		return listToJson;
	}
	
	@RequestMapping("/update")
	public @ResponseBody int cartUpdate(Cart cart) {
		int result = cartSvc.cartUpdate(cart);
		return result;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody int cartDelete(@RequestParam("id") int id) {
		int result = cartSvc.cartDelete(id);
		return result;
	}
}