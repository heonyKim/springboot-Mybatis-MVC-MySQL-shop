package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Sale {
	private int id;
	private int productId;
	private int amount;
	private String unitCd;
	private String startDate;
	private String endDate;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
	
	private String productNm;
	private String categoryCd;
	private int price;
	private String unitNm; 
}