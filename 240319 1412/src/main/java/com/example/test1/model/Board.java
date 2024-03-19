package com.example.test1.model;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String title;
	private String contents;
	private String userId;
	private int hits;
	private String deleteYn;
	private String deleteDate;
	private String kind;
	private int reportCnt;
	private String cDateTime;
	private String uDateTime;
	private int kCal;
	private String nickName;
	
	private String userType; //user sql꺼
	private String comment; // commnet sql꺼
	private String uDate;
	private String cDate; // 'xxxx년 x월 x일'로 나옴
}