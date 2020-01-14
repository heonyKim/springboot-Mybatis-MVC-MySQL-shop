package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Cart {
	private int id;
	private int productId;
	private int cnt;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
	
	private String filePath;
	private String productNm;
	private int price;
	private int saleId;
	private int amount;
	private String unitCd;
	private String endDate;
}