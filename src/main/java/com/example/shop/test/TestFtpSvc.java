package com.example.shop.test;

import java.io.FileInputStream;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class TestFtpSvc {
	protected static String FTP_IP   = "112.175.184.64"; // FTP 접속지 IP
	protected static int    FTP_PORT;            		 // FTP 접속지 Port
	protected static String FTP_ID   = "heonydesign";        // ID
	protected static String FTP_PWD  = "bitc5600!";        // PASSWORD
	protected static String FTP_PATH = "/html/images";
	
	ChannelSftp chSftp=null;
	FileInputStream fileIs=null;
	
	public void connectFtp(){
		//FTP 관련 객체 선언
		
		Session session = null;	//접속계정
		Channel ch = null;		//접속
		JSch jsch= new JSch();		//jsch 객체생성
		
		try {
			// 세션 객체를 생성(사용자 이름, 접속할 호스트, 포트)
	        session = jsch.getSession(FTP_ID, FTP_IP);
	         
	        // 비밀번호 설정
	        session.setPassword(FTP_PWD);
	         
	        // 세션과 관련된 정보를 설정
	        Properties p = new Properties();
	        
	        // 호스트 정보를 검사하지 않음
	        p.put("StrictHostKeyChecking", "no");
	        session.setConfig(p);
	        
	        System.out.println("연결중");
	         
	        // 접속
	        session.connect();        
	 
	        // 채널을 오픈(sftp)
	        ch = session.openChannel("sftp");
	         
	        // 채널에 연결(sftp)        
	        ch.connect();        
	           
	        // 채널을 FTP용 채널 객체로 개스팅
	        chSftp = (ChannelSftp)ch;     
	        
	        System.out.println("FTP 연결이 되었습니다.");
		} catch (Exception e) {
			 e.printStackTrace();
	         System.out.println("FTP 연결에 실패했습니다.");
		}
	}

	public void disconnectFtp() {
		try {
			chSftp.quit(); // Sftp 연결 종료
			System.out.println("FTP 연결을 종료합니다.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
	
}
