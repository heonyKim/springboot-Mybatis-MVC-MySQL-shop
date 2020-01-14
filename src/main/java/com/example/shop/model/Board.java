package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Board {
	private int id;
	private String title;
	private String content;
	private String categoryCd;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
	private int delId;
	private Timestamp delDt;
	
	private int rowNum;
	private String email;
}