package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comment {
	private int id;
	private String content;
	private int rating;
	private int productId;
	private int parentId;
	private int insId;
	private Timestamp insDt;
	private int delId;
	private Timestamp delDe;
	
	private int rowNum;
	private String productNm;
	private String email;
	private int answerId;
	private String answerContent;
}