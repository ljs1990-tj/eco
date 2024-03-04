package com.example.test1.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;

@Service
public class ProductServiceimpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	HttpSession session;
	
	//제품 리스트
	@Override 
	public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return resultMap;
	}

}
