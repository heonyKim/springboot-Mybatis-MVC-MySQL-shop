package com.example.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
import com.example.shop.security.UserDetail;
import com.example.shop.service.EmailService;
import com.example.shop.service.UserService;
import com.example.shop.utils.Script;
import com.example.shop.utils.Util;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService uSvc;
	
	@Autowired
	private BCryptPasswordEncoder passwordEnc;
	
	@GetMapping("/loginForm")
	public String userLoginForm(@AuthenticationPrincipal UserDetail user) {
		if(user!=null) {
			return "redirect:/";
		}else {
			return "/user/loginForm";
		}
	}
	
	@PostMapping("/login")
	public String userLogin() {
		return "redirect:/";
	}

	@GetMapping("/joinForm")
	public String userJoinForm(@AuthenticationPrincipal UserDetail user) {
		if(user != null) {
			return "redirect:/";
		}else {
			return "/user/joinForm";
		}
	}
	
	@RequestMapping("/join/emailCheck")
	public @ResponseBody Integer userJoinEmailCheck(@RequestParam("email") String email) {
		return uSvc.userJoinEmailCheck(email);
	}
	
	
	@PostMapping("/join")
	public @ResponseBody String userJoin(@RequestParam("emailFlag") int emailFlag, User user, Model model) {
		if(emailFlag!=1) {
			return Script.back("가입실패");
		}
		
		String rawPassword = user.getPassword();
		String password = passwordEnc.encode(rawPassword);
		user.setPassword(password);
		
		String addr =user.getAddr1()+", "+user.getAddr2();
		user.setAddr(addr);
		
		String to = user.getEmail();
		String authCode = EmailService.HashedCode25(to);
		user.setAuthCode(authCode);
		
		user.setPhone(Util.replacePhone(user.getPhone()));
		
		int result = uSvc.userJoin(user);
		if(result==1) {
			EmailService emailSvc = new EmailService();
			emailSvc.authMail(to,authCode);
			return Script.hrefWithMsg("메일을 전송하였습니다. 메일 확인 후 인증부탁드립니다.", "/");
		} else {
			return Script.back("회원가입 실패");
		}
	}
	
	@RequestMapping("/join/checkEmailAuth/{code}/{to}")
	public @ResponseBody String checkEmail(@PathVariable("code") String code, @PathVariable("to") String to) {
		User user = uSvc.checkEmail(to);
		
		String authCode = user.getAuthCode();
		if(code.equals(authCode)) {
			uSvc.updateAuth(to);
			return Script.hrefWithMsg("이메일 인증이 완료되었습니다.", "/");
		} else {
			return Script.back("이메일 인증이 실패하였습니다.");
		}
	}
	
	@GetMapping("/info/updateForm")
	public String userInfoUpdateForm(Model model, @AuthenticationPrincipal UserDetail userDetail) {				//BCyrpt
		User user = uSvc.findByEmail(userDetail.getUser().getEmail());
		
		model.addAttribute("user", user);
		return "/user/info/updateForm";				
	}
	
	@PostMapping("/info/update")
	public @ResponseBody String userInfoUpdate(User user) {
		String rawPassword = user.getPassword();
		String password = passwordEnc.encode(rawPassword);
		
		String addr =user.getAddr1()+", "+user.getAddr2();
		user.setAddr(addr);
		user.setPassword(password);
		
		int result = uSvc.update(user);
		if(result==1) {
			return Script.hrefWithMsg("회원정보 수정이 완료되었습니다.", "/");
		}else {
			return Script.hrefWithMsg("회원정보 수정을 실패하였습니다.", "/");
		}		
	}
	
	@RequestMapping("/info/passwordCheck")
	public @ResponseBody String userInfoPasswordCheck(@RequestParam("password") String rawPassword, @AuthenticationPrincipal UserDetail user) {
		String password = user.getUser().getPassword();
		boolean isPasswordCheck = BCrypt.checkpw(rawPassword, password);
		
		String result="";
		if(isPasswordCheck) {
			result = "ok";
		}else {
			result = "fail";
		}
		
		return result;
	}
	
	@RequestMapping("/info/dropout")
	public @ResponseBody String userInfoDropout(@AuthenticationPrincipal UserDetail user) {
		int result = uSvc.dropout(user.getUser().getId()); 
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	
}