package com.example.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Board;
import com.example.shop.service.BoardService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardSvc;
	
	@GetMapping("/list")
	public String boardListWithCategory() {
		return "/board/boardList";
	}
	
	@GetMapping("/list/{categoryCd}")
	public @ResponseBody String boardList(@PathVariable String categoryCd) {
		List<Board> boards = boardSvc.boardList(categoryCd);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(boards);
		data = "{\"data\":" + data + "}";
		return data;
	}
	
	@GetMapping("/view/{id}")
	public String BoardView(@PathVariable int id, Model model) {
		return "/board/boardView";
	}
	
	@RequestMapping("/view/detail/{id}")
	public @ResponseBody String boardViewDetail(@PathVariable int id) {
		Board board = boardSvc.boardView(id);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(board);
		return data;
	}
}