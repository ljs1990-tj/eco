package com.example.test1.dao;

import java.util.HashMap;

public interface ProductService {
	HashMap<String, Object> searchProductList(HashMap<String, Object> map); // 제품 리스트

	HashMap<String, Object> removeProduct(HashMap<String, Object> map); // 제품 삭제

	HashMap<String, Object> searchProductInfo(HashMap<String, Object> map); // 상품 상세정보
  
	HashMap<String, Object> searchCodeList(HashMap<String, Object> map); // code 분류에 따른 제품 리스트
  
	HashMap<String, Object> addProduct(HashMap<String, Object> map); // 제품 추가

	HashMap<String, Object> addCart(HashMap<String, Object> map); // 제품 장바구니 추가

	HashMap<String, Object> addQa(HashMap<String, Object> map); // 문의 등록
	
	HashMap<String, Object> addAdminComment(HashMap<String, Object> map); //1:1 문의 및 상품 문의 답변 등록
	
	HashMap<String, Object> searchListForMain(HashMap<String, Object> map); // 메인 페이지에 쓰일 제품 리스트

}
