package com.example.shop.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int id;
	private String email;
	private String password;
	private String addr;
	private String phone;
	private int role;
	private String authFg;
	private String authCode;
	private Timestamp insDt;
	private String updDt;
	private String delDt;
}