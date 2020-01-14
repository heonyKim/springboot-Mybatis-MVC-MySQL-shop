package com.example.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.User;
import com.example.shop.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository uRepo;
	
	public int userJoinEmailCheck(String email) {
		return uRepo.findByEmailCheck(email);
	}
	
	public int userJoin(User user) {
		return uRepo.save(user);
	}
	
	public User checkEmail(String to) {
		return uRepo.findByEmailAuth(to);
	}
	
	public int updateAuth(String to) {
		return uRepo.updateAuth(to);
	}
	
	public User findByEmail(String email) {
		User user = uRepo.findByEmail(email);

		String addr = user.getAddr();
		String addrs[] = addr.split(",");
		user.setAddr1(addrs[0]);
		user.setAddr2(addrs[1]);
		
		return user;
	}
	
	public int update(User user) {
		return uRepo.update(user);
	}
	
	public int dropout(int id) {
		return uRepo.dropout(id);
	}
}