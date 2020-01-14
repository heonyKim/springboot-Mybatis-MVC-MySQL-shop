package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Product {
	private int id;
	private String productNm;
	private int price;
	private String description;
	private String categoryCd;
	private String filePath;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
	private int delId;
	private Timestamp delDt;
	
	private double ratingAvg;
	private int saleId;
	private int amount;
	private String unitCd;
	private String startDate;
	private String endDate;
	private int salePrice;
	private String categoryNm;
}