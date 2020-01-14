package com.example.shop.repository;

import java.util.HashMap;
import java.util.List;

public interface MainRepository {
	//ADMIN
	int newUserCnt(String date);
	int accountCheckCnt(String date);
	int orderCheckCnt(String date);
	int sellAmountSum(String date);
	List<HashMap<Object, Object>> dailySellAmount(HashMap<String, Object> hash);
	List<HashMap<Object, Object>> sellAmountPercentOfCategory(HashMap<String, Object> hash);
}