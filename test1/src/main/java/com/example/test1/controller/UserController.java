package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main.do") 
    public String main(Model model) throws Exception{		

        return "/main"; 
    }

	@RequestMapping("/user-join.do") 
    public String userJoin(Model model) throws Exception{
		
        return "/user-join";
    }
	

	@RequestMapping("/user-login.do") 
    public String userLogin(Model model) throws Exception{
		session.invalidate();
        return "/user-login";
    }
	//유저 정보 가져오기
	@RequestMapping("/user-myPage.do") 
    public String userMyPage(Model model) throws Exception{

        return "/user-myPage";
    }
	
	
	
	@RequestMapping(value = "/user-join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.addUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.checkUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user-login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		return new Gson().toJson(resultMap);
	}
	//유저정보 가져오기
	@RequestMapping(value = "/user-mypage.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userMyPage(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUser(map);
		return new Gson().toJson(resultMap);
	}
	//유저정보 수정하기
	@RequestMapping(value = "/user-modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userModify(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		return new Gson().toJson(resultMap);
	}
	
}