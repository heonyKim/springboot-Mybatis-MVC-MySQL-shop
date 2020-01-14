package com.example.shop.service;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.security.crypto.bcrypt.BCrypt;

import com.example.shop.utils.Gmail;

public class EmailService {
	
	public static String HashedCode25(String email) {
		String emailAuthNum = BCrypt.hashpw(email, BCrypt.gensalt());
		emailAuthNum = emailAuthNum.replace("$", "");
		emailAuthNum = emailAuthNum.replace("/", "");
		emailAuthNum = emailAuthNum.replace(".", "");
		emailAuthNum = emailAuthNum.replace("(", "");
		emailAuthNum = emailAuthNum.replace(")", "");
		emailAuthNum = emailAuthNum.replaceFirst("2a10", "");
		emailAuthNum = emailAuthNum.substring(25);
		return emailAuthNum;
	}
	
	public void authMail(String to, String code) {
		
		String from = "ez3complex@gmail.com";
		
		String subject = "Shop 회원가입을 위한 이메일 인증입니다.";
		StringBuffer sb = new StringBuffer();
		sb.append("다음 링크에 접속하여 이메일 인증을 진행해주세요. \n");
		sb.append("<a href = 'http://localhost:8080/user/join/checkEmailAuth/"+code+"/"+to+"'>");
		sb.append("이메일 인증하기</a>");
		String content=sb.toString();
		
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.sockerFactory.fallback", "false");

		try{
			Authenticator auth = new Gmail(); //(5)내가 설정한 아이디 비번 넘겨주기
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html; charset=UTF8");
			Transport.send(msg);	//메일전송 최종함수
		
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}