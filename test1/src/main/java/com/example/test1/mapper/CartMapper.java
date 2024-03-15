package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Cart;
import com.example.test1.model.ProductFile;

@Mapper
public interface CartMapper {

	List<Cart> selectCartList(HashMap<String, Object> map);

	void insertCart(HashMap<String, Object> map);

	void removeCart(HashMap<String, Object> map);

	List<ProductFile> selectCartFile(HashMap<String, Object> map);
	void updateSelectCnt(HashMap<String, Object> map);
	void paymentEnd(HashMap<String, Object> map);
	void updatePaymentEndUser(HashMap<String, Object> map);

}
