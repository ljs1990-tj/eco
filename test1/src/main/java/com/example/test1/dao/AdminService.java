package com.example.test1.dao;

import java.util.HashMap;

public interface AdminService {
	HashMap<String, Object> addProduct(HashMap<String, Object> map); // 제품 추가
	HashMap<String, Object> searchProductList(HashMap<String, Object> map); //제품 리스트
	HashMap<String, Object> searchProductView(HashMap<String, Object> map); //제품 뷰
	HashMap<String, Object> editProduct(HashMap<String, Object> map);
	HashMap<String,Object> addProductFile(HashMap<String,Object> map);//상품 이미지 추가
}
