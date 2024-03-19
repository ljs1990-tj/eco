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
	private String uDateTimeNew; //UDATETIEM YYYY/MM/DD로 불러올려고 씀
	
	//ECO_ADMIN_QA
	private int boardNo;
	private String title;
	private String qaContents;
	private String secretYn;
	private String qaUdate;
	
	//ECO_COMMENT
	private int commentNo;      
	private String comment;
	private String userID;
	private int pCommentNo;
	private String regDate;
	private String updateDate; 
	
	
}