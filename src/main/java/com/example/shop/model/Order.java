package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Order {
	private int id;
	private String orderNo;
	private int productId;
	private int cnt;
	private String recipient;
	private String addr;
	private String phone;
	private int discountAmt;
	private int amount;
	private String paymentCd;
	private String deliveryCd;
	private Timestamp orderDt;
	private int insId;
	private Timestamp insDt;
	private Timestamp delDt;
	
	private String email;
	private String productNm;
	private String paymentNm;
	private String deliveryNm;
	private int price;
	private String filePath;
}