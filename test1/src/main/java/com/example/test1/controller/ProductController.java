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

import com.example.test1.dao.ProductService;
import com.google.gson.Gson;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//유기농 제품 페이지
	@RequestMapping("/productOrganic.do") 
    public String productOrganic(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/product-organic";
    }
	
	//비건 제품 페이지
	@RequestMapping("/productVegan.do") 
    public String productVegan(Model model) throws Exception{

        return "/product-vegan";
    }
	
	//글루텐프리 제품 페이지
	@RequestMapping("/productGlutenFree.do") 
    public String productGlutenFree(Model model) throws Exception{

        return "/product-glutenfree";
    }
	
	//로컬푸드 제품 페이지
	@RequestMapping("/productLocalFood.do") 
    public String productLocalFood(Model model) throws Exception{

        return "/product-localfood";
    }
	
	//상품 추가 페이지
		@RequestMapping("/productAdd.do") 
	    public String productAdd(Model model) throws Exception{

	        return "/product-add";
	    }
	
	//제품 리스트
	@RequestMapping(value = "/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.searchProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	//제품 삭제
	@RequestMapping(value = "/productRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.removeProduct(map);
		return new Gson().toJson(resultMap);
	}
}