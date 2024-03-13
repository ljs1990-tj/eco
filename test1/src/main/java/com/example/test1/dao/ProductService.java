package com.example.test1.dao;

import java.util.HashMap;

public interface ProductService {
	HashMap<String, Object> searchProductList(HashMap<String, Object> map); // 제품 리스트

	HashMap<String, Object> removeProduct(HashMap<String, Object> map); // 제품 삭제

	HashMap<String, Object> searchProductInfo(HashMap<String, Object> map); // 상품 상세정보

	HashMap<String, Object> searchCodeList(HashMap<String, Object> map); // cord 분류에 따른 제품 리스트
	
	HashMap<String, Object> addProduct(HashMap<String, Object> map); // 제품 추가

}
