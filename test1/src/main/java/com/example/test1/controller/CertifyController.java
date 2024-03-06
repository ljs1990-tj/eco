package com.example.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertifyController {

	//@Autowire

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

}