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
public class CertifyController {

	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;

	// 테스트 전용
	@RequestMapping("/test.do")
	public String test(Model model) throws Exception {

		return "/test";
	}

	// 유저 정보 수정하기
	@RequestMapping("/user-myPage.do")
	public String userMyPage(Model model) throws Exception {

		return "/user-myPage";
	}

	// 유저 정보 수정하기
	@RequestMapping("/user-myPageView.do")
	public String userMyPageList(Model model) throws Exception {

		return "/user-myPageView";
	}

	// 유저 비밀번호 재확인
	@RequestMapping("/user-myPage-Password.do")
	public String usermyPagePassword(Model model) throws Exception {

		return "/user-myPage-Password";
	}

	// 본인인증 메인 페이지
	@RequestMapping("/user-certifyMain.do")
	public String usercertifyMain(Model model) throws Exception {

		return "/user-certifyMain";
	}

	// 본인인증하기
	@RequestMapping("/user-certifySms.do")
	public String usercertifySms(Model model) throws Exception {

		return "/user-certifySms";
	}

	// 테스트 전용
	@RequestMapping("/user-myPage-addrAdd.do")
	public String usermyPageaddrAdd(Model model) throws Exception {

		return "/user-myPage-addrAdd";
	}

	// 유저정보 가져오기
	@RequestMapping(value = "/user-mypage.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userMyPage(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUser(map);
		return new Gson().toJson(resultMap);
	}

	// 유저정보 수정하기
	@RequestMapping(value = "/user-modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userModify(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.modifyUser(map);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 삭제하기
	@RequestMapping(value = "/delete-addresses.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteaddresses(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.AddrDelete(map);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 가져오기
	@RequestMapping(value = "/user-addr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String useraddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getAddr(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 추가하기
	@RequestMapping(value = "/user-addr-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String useraddradd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// resultMap = userService.getAddr(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

}