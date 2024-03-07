package com.example.test1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartPage {
    private int cartNo;
    private String userId;
    private String itemNo;
    private Date cDatetime;
    private String isPay;
}
