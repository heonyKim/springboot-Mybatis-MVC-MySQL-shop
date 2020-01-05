package com.example.shop.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Board;
import com.example.shop.repository.BoardRepository;
import com.example.shop.service.UserBoardSvc;
import com.example.shop.utils.Pagenation;
import com.google.gson.Gson;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private UserBoardSvc boardSvc;
	
	
	@GetMapping("/list/{categoryCd}")
	public String boardListWithCategory(@PathVariable String categoryCd, Model model) {
		
		return "/board/boardList";
	}
	
	@RequestMapping("/list/list/{categoryCd}")
	public @ResponseBody String boardList(@PathVariable String categoryCd) {
		List<Board> boards = boardSvc.boardList(categoryCd);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		for (Board board : boards) {
			String insDtToString = dateformat.format(board.getInsDt());
			board.setInsDtToString(insDtToString);
		}
		Gson gson=new Gson();
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
		Gson gson = new Gson();
		String data = gson.toJson(board);
		return data;
	}
	
	
}
