package com.example.shop.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.repository.CodeRepository;
import com.example.shop.repository.CommentRepository;

@Service
public class CommentSvc {

	@Autowired
	private CommentRepository commentRep;
}
