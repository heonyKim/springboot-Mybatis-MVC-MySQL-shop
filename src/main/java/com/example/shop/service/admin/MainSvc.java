package com.example.shop.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.repository.MainRepository;
import com.example.shop.utils.Util;

@Service
public class MainSvc {

	@Autowired
	private MainRepository mainRep;
	
	public int newUserCnt(String date){
		return mainRep.newUserCnt(date);
	}
	
	public int accountCheckCnt(String date){
		return mainRep.accountCheckCnt(date);
	}
	
	public int orderCheckCnt(String date){
		return mainRep.orderCheckCnt(date);
	}
	
	public int sellAmountSum(String date){
		return mainRep.sellAmountSum(date);
	}
	
	public List<HashMap<Object, Object>> dailySellAmount(){
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("beforeDate", Util.getBefore7Days());
		hash.put("date", Util.getToday());
				
		List<HashMap<Object, Object>> returnList = mainRep.dailySellAmount(hash);
		int returnListSize = returnList.size();
		
		List<String> dateList = Util.getBeforeDays();
		int listSize = dateList.size();
		
		List<HashMap<Object, Object>> list = new ArrayList<HashMap<Object, Object>>();
		for (int i=0; i<listSize; i++) {
			String date = dateList.get(i);
			
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("orderDate", date);
			map.put("amount", "0");
			
			for (int j=0; j<returnListSize; j++) {
				String orderDate = returnList.get(j).get("orderDate").toString();
				String amount = returnList.get(j).get("amount").toString();
				
				if(date.equals(orderDate)) {
					map.put("amount", amount);
					break;
				}
			}

			list.add(map);
		}
		
		return list;
	}
	
	public List<HashMap<Object, Object>> sellAmountPercentOfCategory(){
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("beforeDate", Util.getBefore7Days());
		hash.put("date", Util.getToday());
				
		List<HashMap<Object, Object>> returnList = mainRep.sellAmountPercentOfCategory(hash);
		int listSize = returnList.size();
		
		int sum = 0;
		for(int i=0; i<listSize; i++) {
			sum += Integer.parseInt(returnList.get(i).get("amount").toString());
		}
		
		List<HashMap<Object, Object>> list = new ArrayList<HashMap<Object, Object>>();
		for(int i=0; i<listSize; i++) {
			String categoryNm = returnList.get(i).get("categoryNm").toString();
			int amount = Integer.parseInt(returnList.get(i).get("amount").toString());
			
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("categoryNm", categoryNm);
			
			double percent = (double) amount / (double) sum * 100.0;
			percent = Math.round(percent*100)/100.0;
			
			map.put("percent", percent + "");
			
			list.add(map);
		}
		
		if(listSize < 6) {
			for(int i=0; i<6-listSize; i++) {
				HashMap<Object, Object> map = new HashMap<Object, Object>();
				map.put("categoryNm", "&nbsp;");
				map.put("percent", "0");
				list.add(map);
			}
		}
		
		return list;
	}
}