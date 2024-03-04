package com.example.test1.model;

import java.util.Date;

public class Cart {

    private int cartNo;
    private String userId;
    private String itemNo;
    private Date cDatetime;
    private String isPay;

    // Default constructor
    public Cart() {
    }

    // Parameterized constructor for all fields
    public Cart(int cartNo, String userId, String itemNo, Date cDatetime, String isPay) {
        this.cartNo = cartNo;
        this.userId = userId;
        this.itemNo = itemNo;
        this.cDatetime = cDatetime;
        this.isPay = isPay;
    }

    // Getters and Setters
    public int getCartNo() {
        return cartNo;
    }

    public void setCartNo(int cartNo) {
        this.cartNo = cartNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo;
    }

    public Date getCDatetime() {
        return cDatetime;
    }

    public void setCDatetime(Date cDatetime) {
        this.cDatetime = cDatetime;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }

    // toString method for debugging purposes
    @Override
    public String toString() {
        return "Cart{" +
                "cartNo=" + cartNo +
                ", userId='" + userId + '\'' +
                ", itemNo='" + itemNo + '\'' +
                ", cDatetime=" + cDatetime +
                ", isPay='" + isPay + '\'' +
                '}';
    }
}
