package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.User;

public interface UserRepository {
	//ADMIN
	int userCheck();
	List<User> findAll();
	int userDelete();
	
	//USER
	int findByEmailCheck(String email);
	User findByEmail(String email);
	User findByEmailAuth(String email);
	int save(User user); 
	int updateAuth(String email);
	int update(User user);
	int dropout(int id);
}