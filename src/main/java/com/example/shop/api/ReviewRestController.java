package com.example.shop.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review")
public class ReviewRestController {

	@GetMapping("/list/{productId}")
	public String ReviewList(@PathVariable int id) {	//List를 Json을 스트링으로 리턴시켜서 ajax처리 해야할까?
		return "";
	}
	
	@PostMapping("/write/{productId}")
	public String ReviewWrite(@PathVariable int id) {	//Json을 스트링으로 리턴시켜서 ajax처리 해야할까?
		return "";
	}
	
	
}
