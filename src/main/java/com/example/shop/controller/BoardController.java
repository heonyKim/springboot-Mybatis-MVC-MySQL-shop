package com.example.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@GetMapping("/list/{CategoryCd}")
	public String BoardList(@PathVariable int id) {
		
		return "/board/list";
	}
	
	@GetMapping("/view/{Id}")
	public String BoardView(@PathVariable int id, Model model) {
		
		return "/board/view";
	}
	
}
