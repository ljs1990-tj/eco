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

	List<Product> selectCodeList(HashMap<String, Object> map); // code 분류에 따른 제품 리스트

	List<ProductFile> selectProductFileInfo(HashMap<String, Object> map); // 제품 이미지 리스트

	List<ProductFile> selectProductContentsFileInfo(HashMap<String, Object> map); // 제품 상세보기 이미지

	List<ProductFile> selectProductDetailFileInfo(HashMap<String, Object> map); // 제품 상세보기에 있는 상세 정보에서 보여줄 이미지

	void insertProduct(HashMap<String, Object> map); // 제품 추가

	void insertCart(HashMap<String, Object> map); // 제품 장바구니 추가

	List<Product> selectReview(HashMap<String, Object> map); // 상품 상세정보 리뷰 불러오기

	List<Product> selectQa(HashMap<String, Object> map); // 상품 상세정보 문의 불러오기

	void insertQa(HashMap<String, Object> map); // 상품 문의 등록
	
	void insertAdminComment(HashMap<String, Object> map); //1:1 문의 및 상품 문의 답변 등록
	
	List<Product> selectProductListMain(HashMap<String, Object> map); // 메인 페이지용 이달의 제품 리스트
	List<Product> selectProductListLatest(HashMap<String, Object> map); // 가장 최근 등록 순으로 정렬된 제품 리스트
	List<Product> selectProductListMax(HashMap<String, Object> map); // 가장 많은 판매 순으로 정렬된 제품 리스트
	List<Product> selectProductListMost(HashMap<String, Object> map); // 가장 많은 리뷰 순으로 정렬된 제품 리스트
}
