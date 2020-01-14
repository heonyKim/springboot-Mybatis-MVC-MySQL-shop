package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Coupon;
import com.example.shop.model.Order;
import com.example.shop.model.Sale;
import com.example.shop.repository.OrderRepository;
import com.example.shop.utils.Util;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRep;

	public List<Order> orderCartList(int id) {
		List<Order> orderList = orderRep.orderCartList(id);
		List<Sale> saleList = orderRep.orderSaleList(id);
		int today = Integer.parseInt(Util.getToday().replace("-", ""));
		
		if(saleList != null) {
			for(int i=0; i<orderList.size(); i++) {
				for(int j=0; j<saleList.size(); j++) {
					int startDate = Integer.parseInt(saleList.get(j).getStartDate());
					int endDate = Integer.parseInt(saleList.get(j).getEndDate());
					
					if(startDate <= today && today <= endDate) {
						if(orderList.get(i).getProductId() == saleList.get(j).getProductId()) {
							int saleAmt = saleList.get(j).getAmount();
							String saleUnitNm = saleList.get(j).getUnitNm();
							int resultPrice = 0;
							
							if(saleUnitNm.equals("원")) {
								resultPrice = orderList.get(i).getPrice() - saleAmt;
							} else {
								double salePercent = 1 - (Double.valueOf(saleAmt) / 100);
								resultPrice = (int)(orderList.get(i).getPrice() * salePercent);
							}
							
							orderList.get(i).setPrice(resultPrice);
							break;
						}
					}
				}
			}
		}
		
		return orderList;
	}
	
	public String orderCoupon(String code){
		String resultStr = "";
		
		Coupon coupon = orderRep.orderCoupon(code);
		if(coupon != null) {
			int today = Integer.parseInt(Util.getToday().replace("-", ""));
			int startDate = Integer.parseInt(coupon.getStartDate());
			int endDate = Integer.parseInt(coupon.getEndDate());
			
			if(startDate <= today && endDate >= today) {
				resultStr = coupon.getAmount() + "" + coupon.getUnitNm();
			} else {
				resultStr = "fail";
			}
		} else {
			resultStr = "fail";
		}
		
		return resultStr;
	}
	
	public String orderCheck(String today) {
		String orderNo = orderRep.orderCheck(today);
		
		if(orderNo != null) {
			int no = Integer.parseInt(orderNo.substring(orderNo.length()-4));
			String newOrderNo = today + "_" + String.format("%04d", no+1);
			
			return newOrderNo;
		} else {
			return today + "_0001";
		}
	}
	
	public String orderInsert(Order order) {
		String resultStr = "";
		
		try {
			int result = orderRep.orderInsert(order);
			
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
	
	public String orderUpdate(Order order) {
		String resultStr = "";
		
		if(order.getPaymentCd().equals("02")) {
			order.setDeliveryCd("02");
		} else {
			order.setDeliveryCd("01");
		}
		
		try {
			int result = orderRep.orderUpdatePayment(order);
			
			if(result > 0) {
				orderRep.orderCartDelete(order.getInsId());
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
	
	public List<Order> orderResultView(String orderNo) {
		List<Order> orderList = orderRep.orderResultView(orderNo);
		return orderList;
	}
	
	public List<Order> orderListAll(int id) {
		List<Order> orderList = orderRep.orderListAll(id);
		
		for (Order order : orderList) {
			List<Order> orderListDetail = orderRep.orderListDetail(order.getOrderNo());
			
			for (Order orderDetail : orderListDetail) {
				order.setAmount(order.getAmount() + orderDetail.getAmount());
				order.setDiscountAmt(order.getDiscountAmt() + orderDetail.getDiscountAmt());
				order.setProductNm(orderDetail.getProductNm());
			}
			
			int listSize = orderListDetail.size();
			if(listSize > 1) {
				order.setProductNm(order.getProductNm() + " 외 " + (listSize - 1) + "건");
			}
		}
		
		return orderList;
	}
}