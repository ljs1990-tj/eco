package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {

	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 유저 로그인

	HashMap<String, Object> addUser(HashMap<String, Object> map); // 유저 회원가입

	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 유저 아이디 중복체크

	HashMap<String, Object> checkUserPhone(HashMap<String, Object> map); // 폰번호로 아이디 찾기

	HashMap<String, Object> modifyUserPw(HashMap<String, Object> map); // 유저 아이디 중복체크

	HashMap<String, Object> getUser(HashMap<String, Object> map); // 유저 마이페이지 정보 가져오기

	HashMap<String, Object> modifyUser(HashMap<String, Object> map); // 유저정보수정

	HashMap<String, Object> AddrDelete(HashMap<String, Object> map); // 유저 마이페이지 주소록 삭제

	HashMap<String, Object> addAddr(HashMap<String, Object> map); // 유저 마이페이지 주소 추가

	HashMap<String, Object> updateAddr(HashMap<String, Object> map); // 유저 마이페이지 주소록 수정하기

	HashMap<String, Object> resetDefaultAddress(HashMap<String, Object> map);// 유저 마이페이지 주소록 기본배송지 설정

	HashMap<String, Object> UserDeletDate(HashMap<String, Object> map);// 회원탈퇴로 인한 회원정보 저장 및 회원정보 수정

	HashMap<String, Object> AuthYnupdateUser(HashMap<String, Object> map);//로그인시 문자 인증하면 AuthYn 변경
	
	HashMap<String, Object> PasswordChage(HashMap<String, Object> map);//유저 비밀번호 변경
								
	HashMap<String, Object> checkPassword(HashMap<String, Object> map);
	
	HashMap<String, Object> CancleupdateUserDelete(HashMap<String, Object> map);//유저 탈퇴 취소하기
	
	HashMap<String, Object> editUserGrade(HashMap<String, Object> map); // 유저 등급 갱신
}
