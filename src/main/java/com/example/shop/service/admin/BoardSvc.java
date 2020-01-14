package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Board;
import com.example.shop.repository.BoardRepository;
import com.example.shop.utils.Util;

@Service
public class BoardSvc {

	@Autowired
	private BoardRepository bRepo;
	
	public List<Board> boardListWithCategory(String categoryCd) {
		return bRepo.findAll(categoryCd);
	}
	
	public int boardWrite(Board board) {
		board.setTitle(Util.replaceTag(board.getTitle()));
		board.setContent(Util.replaceTag(board.getContent()));
		return bRepo.save(board);
	}
	
	public Board boardView(int id) {
		return bRepo.findById(id);
	}
	
	public Board boardUpdateForm(int id) {
		return bRepo.findById(id);
	}
	
	public int boardUpdate(Board board) {
		board.setTitle(Util.replaceTag(board.getTitle()));
		board.setContent(Util.replaceTag(board.getContent()));
		return bRepo.update(board);
	}

	public int boardDelete(Board board) {
		return bRepo.delete(board);
	}
}