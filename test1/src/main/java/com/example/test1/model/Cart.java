package com.example.test1.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
    private int cartNo;
    private String userId;
    private String itemNo;
    private Date cDatetime;
    private String isFavorite;
    private int selectcnt;
    private String filePath;
	private String fileName;
	private int price;
	private float sRate;
	private String itemName;
	private int pRate;
	private int cnt;
	private String transInfo;
	
    }
