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

	public int userCheck() {
		return userRep.userCheck();
	}
	
	public List<User> userList() {
		return userRep.findAll();
	}
	
	public String userDelete() {
		String resultStr = "";
		
		try {
			int result = userRep.userDelete();
			
			if(result >= 0) {
				resultStr = "success";
			} else {
				resultStr = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultStr = "fail";
		}
		
		return resultStr;
	}
}