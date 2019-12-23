package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.User;
import com.example.shop.repository.UserRepository;

@Service
public class UserSvc {
	@Autowired
	private UserRepository userRep;
	
	public List<User> userList() {
		return userRep.findAll();
	}
}
