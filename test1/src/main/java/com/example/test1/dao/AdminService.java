package com.example.test1.dao;

import java.util.HashMap;

public interface AdminService {
	/*
	 * HashMap<String, Object> addProduct(HashMap<String, Object> map); // 제품 추가
	 */
	HashMap<String, Object> addProduct(HashMap<String, Object> map); // 제품 추가

	HashMap<String, Object> searchProductList(HashMap<String, Object> map); // 제품 리스트

	HashMap<String, Object> searchProductView(HashMap<String, Object> map); // 제품 뷰

	HashMap<String, Object> editProduct(HashMap<String, Object> map);

	HashMap<String, Object> addProductFile(HashMap<String, Object> map);// 상품 썸네일 이미지 추가

	HashMap<String, Object> addProductContentsFile(HashMap<String, Object> map);// 상품 컨텐츠 이미지 추가
	
	HashMap<String, Object> addProductDetailFile(HashMap<String, Object> map);// 상품 컨텐츠 이미지 추가

	HashMap<String, Object> removefile(HashMap<String, Object> map);// 파일 삭제

	HashMap<String, Object> searchProductChartList(HashMap<String, Object> map);// 상품 차트리스트 출력

	HashMap<String, Object> searchUserList(HashMap<String, Object> map);

	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);

	HashMap<String, Object> updateUserType(HashMap<String, Object> map);

	HashMap<String, Object> updateUserLoginCntZero(HashMap<String, Object> map);

	HashMap<String, Object> searchUserListAll(HashMap<String, Object> map);
	
	HashMap<String, Object> searchPaymentListAll(HashMap<String, Object> map);

}
