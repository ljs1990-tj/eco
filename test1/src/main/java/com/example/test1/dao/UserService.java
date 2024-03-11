package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	
	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 유저 로그인

	HashMap<String, Object> addUser(HashMap<String, Object> map); // 유저 회원가입

	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 유저 아이디 중복체크

	HashMap<String, Object> getUser(HashMap<String, Object> map); // 유저정보 가져오기

	HashMap<String, Object> modifyUser(HashMap<String, Object> map); // 유저정보수정

	HashMap<String, Object> getAddr(HashMap<String, Object> map); // 유저 주소 목록
	
	HashMap<String, Object> AddrDelete(HashMap<String, Object> map); //유저 주소 삭제
	
	HashMap<String, Object> addAddr(HashMap<String, Object> map); //마이페이지 주소 추카
}
