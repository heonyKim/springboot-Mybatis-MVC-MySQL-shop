package com.example.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Board;
import com.example.shop.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	BoardRepository bRepo;
	
	public List<Board> boardList(String categoryCd) {
		return bRepo.findAlluser(categoryCd);
	}
	
	public Board boardView(int id) {
		return bRepo.findById(id);
	}
}