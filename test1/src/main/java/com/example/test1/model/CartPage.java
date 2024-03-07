package com.example.test1.model;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
