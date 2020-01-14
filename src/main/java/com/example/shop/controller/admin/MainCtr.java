package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.service.admin.MainSvc;
import com.example.shop.utils.Util;

@Controller
@RequestMapping("/admin/main")
public class MainCtr {
	
	@Autowired
	private MainSvc mainSvc;
	
	@GetMapping("")
	public String mainPathRedirect() {
		return "redirect:/admin/main/";
	}
	
	@GetMapping("/")
	public String main() {
		return "/admin/main";
	}
	
	@GetMapping("/newUserCnt")
	public @ResponseBody Map<String, Object> mainnewUserCnt() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = mainSvc.newUserCnt(Util.getToday());
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/accountCheckCnt")
	public @ResponseBody Map<String, Object> mainAccountCheckCnt() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = mainSvc.accountCheckCnt(Util.getToday());
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/orderCheckCnt")
	public @ResponseBody Map<String, Object> mainOrderCheckCnt() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = mainSvc.orderCheckCnt(Util.getToday());
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/sellAmountSum")
	public @ResponseBody Map<String, Object> mainSellAmountSum() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = mainSvc.sellAmountSum(Util.getToday());
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/dailySellAmount")
	public @ResponseBody Map<String, Object> mainDailySellAmount() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<HashMap<Object, Object>> list = mainSvc.dailySellAmount();

		map.put("data", list);
		
		return map;
	}
	
	@GetMapping("/sellAmountPercentOfCategory")
	public @ResponseBody Map<String, Object> mainSellAmountPercentOfCategory() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<HashMap<Object, Object>> list = mainSvc.sellAmountPercentOfCategory();
		
		map.put("data", list);
		
		return map;
	}
}