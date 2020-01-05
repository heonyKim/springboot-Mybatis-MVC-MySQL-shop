package com.example.shop.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int id;
	private int productId;	//FK(Product.id)
	private int cnt;
	private int insId; //FK(User.id)
	private Timestamp insDt; //now()
	private int updId;	//아마도 ==insId
	private Timestamp updDt; //장바구니 add때는 null, 장바구니 목록에 들어가서 수정할때는 now()로 update
	
	//자료 담을 그릇(DB무관)
	private String filePath;
	private String productNm;
	private int price;
	private int saleId;
	private int amount;
	private String unitCd;
	private String endDate;
	
	
}
