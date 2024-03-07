package com.example.test1.dao;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CartMapper;
import com.example.test1.model.Cart;
import com.example.test1.model.Product;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	HttpSession session;
	
	@Override
	public HashMap<String, Object> searchCartList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Cart> list = cartMapper.selectCartList(map);
			
			resultMap.put("list", list);
			resultMap.put("reslut","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("reslut","fail");
		}
		return resultMap;
	}
    
	

}
