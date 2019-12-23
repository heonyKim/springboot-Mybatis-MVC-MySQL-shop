package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.User;

public interface UserRepository {
	//ADMIN
	List<User> findAll();
	
	//USER
	int findByEmailCheck(String email);
	User findByEmail(String email);
	int save(User user); 
	int updateAuth(String email);
//	int update(User user);
}
