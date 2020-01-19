package com.example.shop.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Util {

	public static String getToday() {
		Date date = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String today = transFormat.format(date);
		
		return today;
	}
	
	public static String getBefore7Days() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -7);
		Date date = calendar.getTime();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String beforeDate = transFormat.format(date);
		
		return beforeDate;
	}
	
	public static List<String> getBeforeDays(){
		List<String> dateList = new ArrayList<String>();
		
		for(int i=1; i<=7; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -(7-i));
			Date date = calendar.getTime();

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			String beforeDate = transFormat.format(date);
			
			dateList.add(beforeDate);
		}
		
		return dateList;
	}
	
	public static String replaceTag(String content) {
		content = content
//				.replaceAll("&#", "")
//				.replaceAll("&", "&amp;")
//				.replaceAll("<", "&lt;")
//				.replaceAll(">", "&gt;")
//				.replaceAll("\"", "&quot;")
//				.replaceAll("\'", "&#x27;")
//				.replaceAll("/", "&#x2F;")
				.replaceAll("eval\\((.*)\\)", "")
				.replaceAll("[\\\"\\'][\\s]*javascript:(.*)[\\\"\\']", "\"\"")
				.replaceAll("[\\\"\\'][\\s]*vbscript:(.*)[\\\"\\']", "\"\"")
				.replaceAll("document.cookie", "&#100;&#111;&#99;&#117;&#109;&#101;&#110;&#116;&#46;&#99;&#111;&#111;&#107;&#105;&#101;")
				.replaceAll("<script", "")
				.replaceAll("script>", "")
				.replaceAll("<iframe", "")
				.replaceAll("<object", "")
				.replaceAll("<embed", "")
				.replaceAll("onload", "no_onload")
				.replaceAll("expression", "no_expression")
				.replaceAll("onmouseover", "no_onmouseover")
				.replaceAll("onmouseout", "no_onmouseout")
				.replaceAll("onclick", "no_onclick");
		
		return content; 
	}
	
	public static String replacePhone(String phone) {
		int length = phone.length();
		
		if(length == 11) {
			String phone1 = phone.substring(0, 3);
			String phone2 = phone.substring(3, 7);
			String phone3 = phone.substring(7);
			phone = phone1 + "-" + phone2 + "-" + phone3;
		} else if(length == 10) {
			String phone1 = phone.substring(0, 3);
			String phone2 = phone.substring(3, 6);
			String phone3 = phone.substring(6);
			phone = phone1 + "-" + phone2 + "-" + phone3;
		}
		
		return phone;
	}
}