package com.example.shop.repository;

import java.util.List;

import com.example.shop.model.Code;

public interface CodeRepository {
	//ADMIN
	List<Code> codeList();
	int codeCheck(Code code);
	int codeInsert(Code code);
	int codeUpdate(Code code);
	List<Code> codeListRequest(String codeGbn);
	Code codeRequest(String codeGbn, String code);
	
	//USER
	List<Code> productCode();
}