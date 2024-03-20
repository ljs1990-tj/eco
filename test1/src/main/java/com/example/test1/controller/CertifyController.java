package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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

	// 개인정보처리방침
	@RequestMapping("/Terms-Conditions.do")
	public String TermsConditions(Model model) throws Exception {

		return "/Foot-Terms-Conditions";
	}

	// 개인정보처리방침
	@RequestMapping("/Privacy-Policy.do")
	public String PrivacyPolicy(Model model) throws Exception {

		return "/Foot-Privacy-Policy";
	}

	// 유저 정보
	@RequestMapping("/user-myPage.do")
	public String userMyPage(Model model) throws Exception {

		return "/user-myPage";
	}

	// 유저 정보 수정하기
	@RequestMapping("/user-myPageView.do")
	public String userMyPageList(Model model) throws Exception {

		return "/user-myPageView";
	}

	// 본인인증 메인 페이지
	@RequestMapping("/user-certifyMain.do")
	public String usercertifyMain(Model model) throws Exception {
		session.invalidate();// 세션 끊어버리기
		return "/user-certifyMain";
	}

	// 본인인증하기
	@RequestMapping("/user-certifySms.do")
	public String usercertifySms(Model model) throws Exception {

		return "/user-certifySms";
	}

	// 유저 주소록 추가하기
	@RequestMapping("/user-myPage-addrAdd.do")
	public String usermyPageaddrAdd(Model model) throws Exception {

		return "/user-myPage-addrAdd";
	}

	// 유저 탈퇴 취소하기
	@RequestMapping("/user-resume.do")
	public String userresume(Model model) throws Exception {

		return "/user-resume";
	}

	// 유저 주소록 수정하기
	@RequestMapping("/user-myPage-addrUpdate.do")
	public String usermyPageaddrUpdate(HttpServletRequest request, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/user-myPage-addrUpdate";
	}

	// 로그인 아웃 시키기
	@PostMapping("/logout") // POST 방식의 /logout 요청을 처리
	public String logout(HttpServletRequest request) {
		// 현재 세션을 가져옴
		HttpSession session = request.getSession(false);
		if (session != null) {
			// 세션이 존재하면 세션을 무효화하여 로그아웃 처리
			session.invalidate();
		}
		// 로그아웃 후 로그인 페이지로 리다이렉션
		return "redirect:/header.do"; // 로그인 페이지의 URL로 리다이렉션
	}

	// 로그인시 본인인증 안하면 이동하는 메인 페이지
	@RequestMapping("user-login-certifyMain.do")
	public String userlogincertifyMain(Model model) throws Exception {
		return "/user-login-certifyMain";
	}

	// 로그인시 본인인증하기
	@RequestMapping("/user-login-certifySms.do")
	public String userlogincertifySms(Model model) throws Exception {

		return "/user-login-certifySms";
	}

	// 유저 비밀번호 재확인
	@RequestMapping("/user-myPage-Password.do")
	public String usermyPagePassword(Model model) throws Exception {

		return "/user-myPage-Password";
	}

	// 비밀번호 변경하기
	@RequestMapping("/user-myPage-ChangePassword.do")
	public String usermyPageChangePassword(Model model) throws Exception {

		return "/user-myPage-ChangePassword";
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
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 삭제하기
	@RequestMapping(value = "/delete-addresses.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteaddresses(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.AddrDelete(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 추가하기
	@RequestMapping(value = "/user-addr-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String useraddradd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.addAddr(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 주소록 수정하기
	@RequestMapping(value = "/user-addr-update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String useraddrupdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.updateAddr(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 마이페이지 주소록 기본배송지
	@RequestMapping(value = "/user-addr-default-reset.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String useraddrdefaultreset(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.resetDefaultAddress(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 회원탈퇴하기
	@RequestMapping(value = "/user-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userdelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.UserDeletDate(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 본인인증성공시 self.authYn = 'Y'값으로 변환
	@RequestMapping(value = "/user-authYn.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userauthYn(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.AuthYnupdateUser(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 상세보기 비밀번호 확인
	@RequestMapping(value = "/user-checkPassword.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String usercheckPassword(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.checkPassword(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 비밀번호 변경하기
	@RequestMapping(value = "/changePassword.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String changePassword(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.PasswordChage(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

	// 유저 탈퇴 취소하기
	@RequestMapping(value = "/user-resume.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userresume(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.CancleupdateUserDelete(map);
		System.out.println(resultMap);
		return new Gson().toJson(resultMap);
	}

}