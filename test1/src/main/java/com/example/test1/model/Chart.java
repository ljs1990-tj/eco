package com.example.test1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chart {
	private int itemNo;
	private String itemName;
	private int value;
	private int month;
	private int totalPay;
	private int price;
	private String code;
}
