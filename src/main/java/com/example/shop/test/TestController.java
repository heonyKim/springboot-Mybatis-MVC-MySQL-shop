package com.example.shop.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	TestFtpSvc testFtpSvc = new TestFtpSvc();
	
	@GetMapping("/test")
	public String test() {
		testFtpSvc.connectFtp();
		return "/test";
	}
	
	
	
	
}
