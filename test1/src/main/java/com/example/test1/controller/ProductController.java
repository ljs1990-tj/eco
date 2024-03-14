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
	
	// 유기농 제품 페이지
	@RequestMapping("/productList.do")
	public String productOrganic(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/product-list";
	}
	
	// 상품 상세 페이지
	@RequestMapping("/productView.do")
	public String productView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/product-view";
	}
	// 상품 등록 페이지
	@RequestMapping("/productAddFarmer.do")
	public String productAddFarmer(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/product-add-farmer";
	}
	
	// 제품 리스트
	@RequestMapping(value = "/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.searchProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	//상품 수정 페이지
	@RequestMapping("/ProductUpdate.do") 
	public String productUpdate(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/product-update";
	}
		

	// cord 분류에 따른 제품 리스트
	@RequestMapping(value = "/cordList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cordList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.searchCodeList(map);
		return new Gson().toJson(resultMap);
	}

	// 제품 삭제
	@RequestMapping(value = "/productRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.removeProduct(map);
		return new Gson().toJson(resultMap);
	}

	// 제품 상세 정보
	@RequestMapping(value = "/productView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.searchProductInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 제품 추가
	@RequestMapping(value = "/addProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.addProduct(map);
		return new Gson().toJson(resultMap);
	}
	
	//장바구니 추가
	@RequestMapping(value = "/addCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.addCart(map);
		return new Gson().toJson(resultMap);
	}
}