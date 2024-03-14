package com.example.test1.model;

import lombok.Data;

@Data
public class Product {
	private int itemNo;
	private String itemName;
	private int price;
	private float sRate;
	private float pRate;
	private String contents;
	private String transInfo;
	private String sellYn;
	private String cDateTime;
	private String uDateTime;
	private int cnt;
	private String code;
	private String kind;
	private int cellCnt;
	
	//ECO_ADMIN_REVIEW
	private int reviewNo;
	private String userId;
	private String rContents;
	private double score;
	private String deleteYn;
	private String deleteDate;
	
	private String name;
	private String hideName;
}