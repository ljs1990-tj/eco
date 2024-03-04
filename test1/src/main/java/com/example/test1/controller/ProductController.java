package com.example.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	//유기농 제품 페이지
	@RequestMapping("/productOrganic.do") 
    public String productOrganic(Model model) throws Exception{

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
}