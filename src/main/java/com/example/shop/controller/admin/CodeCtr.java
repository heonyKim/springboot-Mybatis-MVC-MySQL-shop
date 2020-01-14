package com.example.shop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.shop.model.Code;
import com.example.shop.security.UserDetail;
import com.example.shop.service.admin.CodeSvc;

@Controller
public class CodeCtr {
	
	@Autowired
	private CodeSvc codeSvc;
	
	@GetMapping("/admin/code")
	public String codePathRedirect() {
		return "redirect:/admin/code/";
	}
	
	@GetMapping("/admin/code/")
	public String code() {
		return "/admin/code";
	}
	
	@GetMapping("/admin/code/list")
	public @ResponseBody Map<String, Object> codeList() {
		List<Code> codeList = codeSvc.codeList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", codeList);
		
		return map;
	}
	
	@PostMapping("/admin/code/insert")
	public @ResponseBody Map<String, Object> codeInsert(@AuthenticationPrincipal UserDetail userDetail, Code code) {
		code.setInsId(userDetail.getUser().getId());
		code.setUpdId(userDetail.getUser().getId());
		
		String result = codeSvc.codeInsert(code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return map;
	}
	
	@PostMapping("/admin/code/update")
	public @ResponseBody Map<String, Object> codeUpdate(@AuthenticationPrincipal UserDetail userDetail, Code code) {
		code.setUpdId(userDetail.getUser().getId());
		String result = codeSvc.codeUpdate(code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
	@GetMapping("/code/{codeGbn}")
	public @ResponseBody List<Code> codeListRequest(@PathVariable String codeGbn) {
		List<Code> codeList = codeSvc.codeListRequest(codeGbn);
		
		return codeList;
	}
	
	@GetMapping("/code/{codeGbn}/{code}")
	public @ResponseBody Code codeRequest(@PathVariable String codeGbn, @PathVariable String code) {
		Code c = codeSvc.codeRequest(codeGbn, code);
		
		return c;
	}
}
