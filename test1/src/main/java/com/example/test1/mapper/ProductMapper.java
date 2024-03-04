package com.example.test1.mapper;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;

@Mapper
public interface ProductMapper {
	List<Product> selectProductList(HashMap<String, Object> map); //제품 리스트
	void deleteProduct(HashMap<String, Object> map); //제품삭제
	Product selectProductInfo(HashMap<String, Object> map); // 상품 상세정보
	List<Product> selectCodeList(HashMap<String, Object> map); // cord에 따른 제품 리스트
	
}

