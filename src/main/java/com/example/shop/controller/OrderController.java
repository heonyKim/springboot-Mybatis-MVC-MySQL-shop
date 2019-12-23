package com.example.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	//여기 설계하는거 머리가 안돌아가서 패스함
	
	/*
	 *  	/order
      	  	/calc
      		/payment
      		/result
      		/list
      		/view/{orderNo}
	 * 
	 */

	@GetMapping("/payment")
	public String orderPayment() {
		return "/order/payment";
	}
	@GetMapping("/result")
	public String orderResult() {
		return "/order/result";
	}
	
}
