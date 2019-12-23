package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Coupon {
	private int id;
	private String code;
	private String description;
	private int amount;
	private String unitCd;
	private String startDate;
	private String endDate;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
	
	private String unitNm;
}