package com.example.test1.dao;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AdminMapper;
import com.example.test1.mapper.CartMapper;
import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Addr;
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
			List<Addr> addrList = cartMapper.selectAddrList(map);
			resultMap.put("list", list);
			resultMap.put("user", user);
			resultMap.put("addrList",addrList);
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
			int i = cartMapper.selectCartCheck(map);
			
			if( i == 1) {
				cartMapper.updateCartSelect(map);
				resultMap.put("result", "Update");
				resultMap.put("result", "success");
			}else {
				cartMapper.insertCart(map);
				resultMap.put("result", "Insert");
				resultMap.put("result", "success");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
			
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
			cartMapper.PaymentEndUpdateProduct(map);
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

	@Override
	public HashMap<String, Object> addFavoriteItem(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			int check = cartMapper.selectFavoriteCheck(map);
			if(check == 1) {
				cartMapper.removeFavorite(map);
				resultMap.put("result", "remove");
			}else {
				cartMapper.insertFavorite(map);
				resultMap.put("result", "insert");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
    
	

}
