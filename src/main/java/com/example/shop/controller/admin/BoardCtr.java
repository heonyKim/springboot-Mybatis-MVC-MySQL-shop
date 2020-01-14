package com.example.shop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Board;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.BoardSvc;
import com.example.shop.utils.Script;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/board")
public class BoardCtr {
	
	@Autowired
	private BoardSvc boardSvc;
	
	@GetMapping("")
	public String boardPathRedirect() {
		return "redirect:/admin/board/list";
	}
	
	@GetMapping("/")
	public String boardPathRedirect2() {
		return "redirect:/admin/board/list";
	}
	
	@GetMapping("/list")
	public String boardList() {
		return "/admin/boardList";
	}
	
	@GetMapping("/list/{categoryCd}")
	public @ResponseBody String boardListWithCategory(@PathVariable String categoryCd) {
		List<Board> boards = boardSvc.boardListWithCategory(categoryCd);
		
		Gson gson = new Gson();
		String toJson = gson.toJson(boards);
		toJson = "{\"data\":"+toJson+"}";
		
		return toJson;
	}
	
	@GetMapping("/writeForm/{categoryCd}")
	public String boardWriteForm(@PathVariable String categoryCd, Model model) {
		model.addAttribute("categoryCd", categoryCd);
		return "/admin/boardWrite";
	}
	
	@PostMapping("/write")
	public @ResponseBody String boardWrite(@AuthenticationPrincipal UserDetail userDetail, Board board) {
		board.setInsId(userDetail.getUser().getId());
		board.setUpdId(userDetail.getUser().getId());
		int result = boardSvc.boardWrite(board);
		
		if(result == 1) {
			return Script.hrefWithMsg("글을 저장하였습니다.", "/admin/board/list?category=" + board.getCategoryCd());
		}else {
			return Script.back("글 작성을 실패하였습니다. 다시 시도해 주세요.");
		}
	}

	@GetMapping("/view/{id}")
	public String boardView(@PathVariable int id, Model model) {
		Board board = boardSvc.boardView(id);
		
		model.addAttribute("board", board);
		model.addAttribute("type", "board");
		
		return "/admin/boardView";
	}
	
	@GetMapping("/updateForm/{id}")
	public String boardUpdateForm(@PathVariable int id, Model model) {
		Board board = boardSvc.boardUpdateForm(id);
		
		model.addAttribute("board", board);
		
		return "/admin/boardUpdate";
	}
	
	@PostMapping("/update")
	public @ResponseBody String boardUpdate(@AuthenticationPrincipal UserDetail userDetail, Board board) {
		board.setUpdId(userDetail.getUser().getId());
		int result = boardSvc.boardUpdate(board);
		
		if(result == 1) {
			return Script.hrefWithMsg("글을 수정하였습니다.", "/admin/board/view/"+ board.getId());
		}else {
			return Script.back("글 수정을 실패하였습니다. 다시 시도해 주세요.");
		}
	}

	@GetMapping("/delete/{id}")
	public @ResponseBody String boardDelete(@AuthenticationPrincipal UserDetail userDetail, @PathVariable int id) {
		Board board = new Board();
		board.setDelId(userDetail.getUser().getId());
		board.setId(id);
		
		int result = boardSvc.boardDelete(board);
		
		if(result == 1) {
			return Script.hrefWithMsg("글을 삭제하였습니다.", "/admin/board");
		}else {
			return Script.back("글 삭제를 실패하였습니다. 다시 시도해 주세요.");
		}
	}	
}