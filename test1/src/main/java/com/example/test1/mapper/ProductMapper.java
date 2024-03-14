package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;

@Mapper
public interface ProductMapper {
	List<Product> selectProductList(HashMap<String, Object> map); // 제품 리스트

	void deleteProduct(HashMap<String, Object> map); // 제품삭제

	Product selectProductInfo(HashMap<String, Object> map); // 상품 상세정보

	List<Product> selectCodeList(HashMap<String, Object> map); // cord 분류에 따른 제품 리스트

	List<ProductFile> selectProductFileInfo(HashMap<String, Object> map); // 제품 이미지 리스트

	List<ProductFile> selectProductContentsFileInfo(HashMap<String, Object> map); // 제품 상세보기 이미지

	List<ProductFile> selectProductDetailFileInfo(HashMap<String, Object> map); // 제품 상세보기에 있는 상세 정보에서 보여줄 이미지

	void insertProduct(HashMap<String, Object> map); // 제품 추가
	
	void insertCart(HashMap<String, Object> map); //제품 장바구니 추가
	
	List<Product> selectReview(HashMap<String, Object> map); // 상품 상세정보 리뷰불러오기

}
