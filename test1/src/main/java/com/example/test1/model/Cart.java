package com.example.test1.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
    private int cartNo;
    private String userId;
    private String itemNo;
    private Date cDatetime;
    private String isPay;
}
