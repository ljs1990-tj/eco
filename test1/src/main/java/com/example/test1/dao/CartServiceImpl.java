package com.example.test1.dao;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AdminMapper;
import com.example.test1.mapper.CartMapper;
import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Cart;
import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;
import com.example.test1.model.User;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;
	
	@Override
	public HashMap<String, Object> searchCartList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			List<Cart> list = cartMapper.selectCartList(map);
			User user = userMapper.selectUser(map);
			resultMap.put("list", list);
			resultMap.put("user", user);
			resultMap.put("reslut","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("reslut","fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addCartItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.insertCart(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeCartItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.removeCart(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editSelectCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.updateSelectCnt(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> paymentFinishCart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.paymentEnd(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> paymentFinishUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.updatePaymentEndUser(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> paymentFinishChart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int check = cartMapper.selectChartCheck(map);
			
			if(check == 1) {
				//update
				cartMapper.updateProductChart(map);
			}else {
				//insert
				cartMapper.insertProductChart(map);
			}

			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> paymentFinishHistory(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartMapper.insertPaymentHistory(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
    
	

}
