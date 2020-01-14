package com.example.shop.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Order;
import com.example.shop.repository.OrderRepository;

@Service
public class OrderSvc {
	
	@Autowired
	private OrderRepository orderRep;
	
	public List<Order> orderList(){
		return orderRep.orderList();
	}
	
	public List<Map<String, String>> orderView(String orderNo) {
		List<Order> orderView = orderRep.orderView(orderNo);
		
		String productList = "";
		int sumOfdiscountAmt = 0;
		int sumOfamount = 0;
		int resultAmt = 0;
		
		for (Order order : orderView) {
			if(!productList.equals("")) {
				productList += "\r\n";
			}
			
			productList += order.getProductNm() + "(" + order.getCnt() + "개)";
			sumOfdiscountAmt += order.getDiscountAmt();
			sumOfamount += order.getAmount();
		}
		
		resultAmt = sumOfamount - sumOfdiscountAmt;
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> hash = new HashMap<String, String>();
		hash.put("orderNo", orderView.get(0).getOrderNo());
		hash.put("productList", productList);
		hash.put("recipient", orderView.get(0).getRecipient());
		hash.put("addr", orderView.get(0).getAddr());
		hash.put("phone", orderView.get(0).getPhone());
		hash.put("discountAmt", sumOfdiscountAmt+"");
		hash.put("amount", sumOfamount+"");
		hash.put("resultAmt", resultAmt+"");
		hash.put("paymentNm", orderView.get(0).getPaymentNm());
		hash.put("deliveryCd", orderView.get(0).getDeliveryCd());
		hash.put("orderDt", orderView.get(0).getOrderDt().toString());
		list.add(hash);
		
		return list;
	}
	
	public String orderUpdate(Order order) {
		String resultStr = "";
		
		try {
			int result = orderRep.orderUpdate(order);
			
			if(result > 0) {
				resultStr = "success";
			} else {
				resultStr ="fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultStr ="fail";
		}
		
		return resultStr;
	}
}