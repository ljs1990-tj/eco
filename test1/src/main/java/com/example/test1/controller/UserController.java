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
	public String main(Model model) throws Exception {

		return "/main";
	}
	// 헤더만 있는 임시 메인
	@RequestMapping("/header.do")
	public String header(Model model) throws Exception {
		
		return "/layout/header";
	}
	// 가입 페이지
	@RequestMapping("/user-join.do")
	public String userJoin(Model model) throws Exception {

		return "/user-join";
	}
	// 로그인 페이지
	@RequestMapping("/user-login.do")
	public String userLogin(Model model) throws Exception {
		session.invalidate();
		return "/user-login";
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/find-id.do") 
    public String findId(Model model) throws Exception{
		
        return "/find-id";
    }
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/find-password.do") 
    public String findPassword(Model model) throws Exception{
		
        return "/find-password";
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
		resultMap = userService.searchUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/changePw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String changeUserPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.modifyUserPw(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/checkPhoneNum.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkPhoneNum(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.checkUserPhone(map);
		return new Gson().toJson(resultMap);
	}
	//유저 등급 갱신
	@RequestMapping(value = "/userGradeUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userGradeUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.editUserGrade(map);
		return new Gson().toJson(resultMap);
	}
	
	

}