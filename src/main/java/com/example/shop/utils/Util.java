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
}
