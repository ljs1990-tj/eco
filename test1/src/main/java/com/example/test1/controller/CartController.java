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
		@RequestMapping("cartList.do") 
	    public String cartList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			
	        return "/cart-list";
	    }
		@RequestMapping("FavoriteList.do") 
	    public String FavoriteList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			
	        return "/Favorite-list";
	    }
		
		@RequestMapping("KakaoPaycart.do") 
	    public String kakaoPay(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			
	        return "/KakaoPay";
	    }

		
		//cart 추가
		@RequestMapping(value = "/cart/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String cartInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.addCartItem(map);
			return new Gson().toJson(resultMap);
		}
		//찜하기 추가
		@RequestMapping(value = "FavoriteAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String Favorite(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.addFavoriteItem(map);
			return new Gson().toJson(resultMap);
		}
		
		//cart 제거
		@RequestMapping(value = "/cart/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String productRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.removeCartItem(map);
			return new Gson().toJson(resultMap);
		}
		//cart 리스트
		@RequestMapping(value = "/cart/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String cartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.searchCartList(map);
			return new Gson().toJson(resultMap);
		}
		
		//상품 선택 갯수 수정
		@RequestMapping(value = "/cart/ChangSelectCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String ChangSelectCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.editSelectCnt(map);
			return new Gson().toJson(resultMap);
		}
		
		
		//결제완료
		@RequestMapping(value = "paymentEndCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String deleteCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.paymentFinishCart(map);
			return new Gson().toJson(resultMap);
		}
		
		
		//결제완료 시점 유저페이지 업데이트
		@RequestMapping(value = "paymentEndUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String paymentEndUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.paymentFinishUser(map);
			return new Gson().toJson(resultMap);
		}
		
		//결제완료 시점 차트페이지 업데이트
		@RequestMapping(value = "paymentEndChart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String paymentEndChart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.paymentFinishChart(map);
			return new Gson().toJson(resultMap);
		}
		
		
		//결제완료 시점 결제로그 payment 테이블에 저장
		@RequestMapping(value = "paymentEndHistorySave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String paymentEndHistorySave(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = cartService.paymentFinishHistory(map);
			return new Gson().toJson(resultMap);
		}
	
}