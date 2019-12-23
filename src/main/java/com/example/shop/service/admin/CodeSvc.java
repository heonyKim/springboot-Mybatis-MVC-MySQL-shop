package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Code;
import com.example.shop.repository.CodeRepository;

@Service
public class CodeSvc {

	@Autowired
	private CodeRepository codeRep;
	
	public List<Code> codeList(){
		return codeRep.codeList();
	}
	
	public int codeCheck(Code code){
		return codeRep.codeCheck(code);
	}
	
	public String codeInsert(Code code) {
		int check = codeCheck(code);
		String resultStr = "";
		
		if(check <= 0) {
			try {
				int resultCnt = codeRep.codeInsert(code);
				
				if(resultCnt > 0) {
					resultStr = "success";
				} else {
					resultStr ="fail";
				}
			} catch (Exception e) {
				e.printStackTrace();
				resultStr = "fail";
			}
		} else {
			resultStr = "duplicate";
		}
		
		return resultStr;
	}
	
	public String codeUpdate(Code code) {
		int check = codeCheck(code);
		String resultStr = "";
		
		if(check <= 0) {
			try {
				int result = codeRep.codeUpdate(code);
				
				if(result > 0) {
					resultStr = "success";
				} else {
					resultStr = "fail";
				}
			} catch (Exception e) {
				e.printStackTrace();
				resultStr = "fail";
			}
		} else {
			resultStr = "duplicate";
		}
		
		return resultStr;
	}
	
	public List<Code> codeRequest(String codeGbn){
		return codeRep.codeRequest(codeGbn);
	}
}
