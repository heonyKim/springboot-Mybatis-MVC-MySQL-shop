package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Board;

public interface BoardRepository {
	//ADMIN
	List<Board> findAll(String categoryCd);
	int save(Board board);
	Board findById(int id);
	int update(Board board);
	int delete(Board board);
	
	//USER
	List<Board> findAlluser(String categoryCd);
	public int boardCount();
}