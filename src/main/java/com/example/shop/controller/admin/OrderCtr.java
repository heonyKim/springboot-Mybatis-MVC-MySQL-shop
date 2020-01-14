package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Order;
import com.example.shop.service.admin.OrderSvc;

@Controller
@RequestMapping("/admin/order")
public class OrderCtr {
	
	@Autowired
	private OrderSvc orderSvc;
	
	@GetMapping("")
	public String orderPathRedirect() {
		return "redirect:/admin/order/";
	}
	
	@GetMapping("/")
	public String order() {
		return "/admin/order";
	}
	
	@GetMapping("/list")
	public @ResponseBody Map<String, Object> orderList() {
		List<Order> orderList = orderSvc.orderList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", orderList);
		
		return map;
	}
	
	@GetMapping("/view/{orderNo}")
	public @ResponseBody Map<String, Object> orderView(@PathVariable String orderNo) {
		List<Map<String, String>> list = orderSvc.orderView(orderNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}
	
	@PostMapping("/update")
	public @ResponseBody Map<String, Object> orderUpdate(Order order) {
		String resultStr = orderSvc.orderUpdate(order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", resultStr);
		
		return map;
	}
}