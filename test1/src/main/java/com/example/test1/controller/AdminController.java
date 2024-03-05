package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.AdminService;
import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class AdminController {
	
	
	@Autowired
	AdminService adminService;
	
	//어드민 페이지 메인
	@RequestMapping("/admin-main.do") 
    public String main(Model model) throws Exception{		

        return "/admin-Main"; 
    }
	
	//상품 추가 페이지
	@RequestMapping("/productAdd.do") 
	public String productAdd(Model model) throws Exception{

		return "/product-add";
	}
	
	//상품 리스트 페이지
	@RequestMapping("/productList.do") 
	public String productList(Model model) throws Exception{

		return "/product-list";
	}
	
	//상품 업데이트 페이지
	@RequestMapping("/productUpdate.do") 
	public String productUpdate(Model model) throws Exception{

		return "/product-update";
	}
	
	
	@RequestMapping(value = "/productAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.addProduct(map);
		return new Gson().toJson(resultMap);
	}

	
}