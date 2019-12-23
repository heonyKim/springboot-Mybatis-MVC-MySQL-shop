package com.example.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.User;
import com.example.shop.repository.UserRepository;
import com.example.shop.service.EmailSvc;
import com.example.shop.utils.Script;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserRepository uRepo;
	
	@Autowired
	private BCryptPasswordEncoder passwordEnc;
	
	@GetMapping("/loginForm")
	public String userLoginForm() {
		return "/user/loginForm";
	}
	
	@PostMapping("/login")
	public String userLogin() {
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@GetMapping("/joinForm")
	public String userJoinForm() {
		return "/user/joinForm";
	}
	
	@RequestMapping("/join/emailCheck")
	@ResponseBody
	public Integer userJoinEmailCheck(@RequestParam("email") String email) {
		System.out.println(email);
		Integer count = uRepo.findByEmailCheck(email);
		System.out.println(count);
		return count;
	}
	
	
	@PostMapping("/join")		//인증, BCyrpt 넣자
	public @ResponseBody String userJoin(@RequestParam("emailFlag") int emailFlag,User user,Model model) {

		if(emailFlag!=1) {
			return Script.back("가입실패");
		}
		
		//BCrypt Password
		String rawPassword = user.getPassword();
		String password = passwordEnc.encode(rawPassword);
		user.setPassword(password);
		
		String to = user.getEmail();
		String authCode = EmailSvc.HashedCode25(to);
		user.setAuthCode(authCode);
		int result=uRepo.save(user);
		
		if(result==1) {
			EmailSvc emailSvc = new EmailSvc();
			emailSvc.authMail(to,authCode);
			return Script.hrefWithMsg("메일을 전송하였습니다. 메일 확인 후 인증부탁드립니다.", "/");
		}else {
			return Script.back("회원가입 실패");
		}
		
	}
	
	@RequestMapping("/join/checkEmailAuth/{code}/{to}")
	public @ResponseBody String checkEmail(
		@PathVariable("code") String code,
		@PathVariable("to") String to) {
		
		User user = uRepo.findByEmail(to);
		String authCode = user.getAuthCode();
		if(code.equals(authCode)) {
			uRepo.updateAuth(to);
			return Script.hrefWithMsg("이메일 인증이 완료되었습니다.", "/");
		}else {
			return Script.back("이메일 인증이 실패하였습니다.");
		}
		
	}
	
	//////////////////////////////mail////////////////////////////////////////
	
	
	
	//////////////////////////////User Infomation////////////////////////////////////////
	
	@GetMapping("/info/updateForm")
	public @ResponseBody String userInfoUpdateForm() {				//BCyrpt
		String emailAuthNum = EmailSvc.HashedCode25("heony_design@naver.com");
		return emailAuthNum;
		//		return "/user/info/updateForm";				
	}
	
	@PostMapping("/info/update")
	public String userInfoUpdate() {					//BCyrpt
		return "/";				
	}
	
	@GetMapping("/info/changePasswordForm")		
	public String userInfoChangePasswordForm() {		//BCyrpt
		return "/user/info/changePasswordForm";			
	}
	
	@PostMapping("/info/changePassword")			
	public String userInfoChangePassword() {			//BCyrpt, 세션만료시켜서 다시 로그인 하게 만들자
		return "/";
	}
	
}
