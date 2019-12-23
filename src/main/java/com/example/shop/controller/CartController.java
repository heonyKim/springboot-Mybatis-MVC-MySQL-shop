package com.example.shop.controller;

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
import com.example.shop.model.User;
import com.example.shop.repository.CartRepository;
import com.example.shop.service.CartSvc;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartSvc cartSvc;
	
	@PostMapping("/add")
	public String cartAdd(Cart cart, 
			Model model
			/*,@AuthenticationPrincipal User user*/) {
		
		/*int insId는 로그인 후에 @principal로 현재 로그인된
		 * user의 id값으로 가져오게 해야함. 추후수정
		 */
		//int userId = user.getId();
		int userId = 1;
		cart.setInsId(userId);
		cartSvc.cartAdd(cart);
		return "redirect:/cart/list";
	}
	
	@GetMapping("/list")
	public String cartList(Model model
			/*,@AuthenticationPrincipal User user*/) {
		/*int insId는 로그인 후에 @principal로 현재 로그인된
		 * user의 id값으로 가져오게 해야함. 추후수정
		 */
		//int userId = user.getId();
		int userId = 1;
		List<Cart> list =cartSvc.cartList(userId);
		model.addAttribute("list",list);
		return "/cart/list";
	}
	
	@RequestMapping("/delete")
	public @ResponseBody int cartDelete(@RequestParam("id") int id) {
		int result = cartSvc.cartDelete(id);
		return result;
	}
}
