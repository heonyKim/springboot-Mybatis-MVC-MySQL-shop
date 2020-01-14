package com.example.shop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.shop.model.User;
import com.example.shop.repository.UserRepository;

@Service
public class UserDetailService implements UserDetailsService{

	@Autowired
	private UserRepository rep;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = rep.findByEmail(username);
		UserDetail userDetails = null;
		
		if(user != null) {
			userDetails = new UserDetail();
			userDetails.setUser(user);
		} else {
			throw new UsernameNotFoundException("Email not found");
		}
		return userDetails;
	}

}