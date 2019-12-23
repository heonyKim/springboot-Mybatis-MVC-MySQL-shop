package com.example.shop.service;

import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Cart;
import com.example.shop.repository.CartRepository;
import com.example.shop.repository.UserRepository;
import com.example.shop.utils.Gmail;

@Service
public class CartSvc {

	@Autowired
	private CartRepository cRepo;
	
	public int cartAdd(Cart cart) {
		int result = cRepo.save(cart);
		return result;
	}
	
	public List<Cart> cartList(int userId) {
		return cRepo.findAll(userId);
	}
	
	public int cartDelete(int id) {
		return cRepo.delete(id);
	}
}
