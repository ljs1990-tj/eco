package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.CartService;
import com.google.gson.Gson;

@Controller
public class CartController { 
	
	@Autowired
	CartService cartService;
	
	//cart 페이지
		@RequestMapping("/cartList.do") 
	    public String productOrganic(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
	        return "/cart-list";
	    }
	
	
	//cart 리스트
		@RequestMapping(value = "/cartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String cartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.searchCartList(map);
			return new Gson().toJson(resultMap);
		}
	
}

