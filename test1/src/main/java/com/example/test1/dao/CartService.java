package com.example.test1.dao;

import java.util.HashMap;

public interface CartService {
	HashMap<String, Object> searchCartList(HashMap<String, Object> map); // 카트 리스트

	HashMap<String, Object> addCartItem(HashMap<String, Object> map);

	HashMap<String, Object> removeCartItem(HashMap<String, Object> map);

	HashMap<String, Object> editSelectCnt(HashMap<String, Object> map);

	HashMap<String, Object> paymentFinishCart(HashMap<String, Object> map);

	HashMap<String, Object> paymentFinishUser(HashMap<String, Object> map);

	HashMap<String, Object> paymentFinishChart(HashMap<String, Object> map);

	HashMap<String, Object> paymentFinishHistory(HashMap<String, Object> map);
	
	HashMap<String, Object> addFavoriteItem(HashMap<String, Object> map);
}
