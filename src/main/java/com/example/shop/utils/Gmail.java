package com.example.shop.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("ez3complex@gmail.com", GooglePassword.GOOGLEPASSWORD());
	}
}
