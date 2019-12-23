package com.example.shop.model;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Code {
	private int id;
	private String codeGbn;
	private String code;
	private String codeNm;
	private String useFg;
	private int insId;
	private Timestamp insDt;
	private int updId;
	private Timestamp updDt;
}