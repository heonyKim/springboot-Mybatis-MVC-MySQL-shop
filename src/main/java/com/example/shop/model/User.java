package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {
	private int id;
	private String email;
	private String password;
	private String addr;
	private String phone;
	private String roleCd;
	private String authFg;
	private String authCode;
	private Timestamp insDt;
	private String updDt;
	private String delDt;
	
	private String roleNm;
	private String role;
	private String addr1;
	private String addr2;
}