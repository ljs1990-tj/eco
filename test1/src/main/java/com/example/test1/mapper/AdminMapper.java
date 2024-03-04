package com.example.test1.mapper;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;

@Mapper
public interface AdminMapper {
	
	void insertProduct(HashMap<String, Object> map);
	List<Product> selectProductList(HashMap<String, Object> map);
	
	Product selectProductView(HashMap<String, Object> map);
	
	void updateProduct(HashMap<String,Object> map);
}

