package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {

	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 유저 로그인

	HashMap<String, Object> addUser(HashMap<String, Object> map); // 유저 회원가입

	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 유저 아이디 중복체크

	HashMap<String, Object> modifyUserPw(HashMap<String, Object> map); // 유저 아이디 중복체크

	HashMap<String, Object> getUser(HashMap<String, Object> map); // 유저 마이페이지 정보 가져오기

	HashMap<String, Object> modifyUser(HashMap<String, Object> map); // 유저정보수정

	HashMap<String, Object> getAddr(HashMap<String, Object> map); // 유저 마이페이지 주소록 목록 호출

	HashMap<String, Object> AddrDelete(HashMap<String, Object> map); // 유저 마이페이지 주소록 삭제

	HashMap<String, Object> addAddr(HashMap<String, Object> map); // 유저 마이페이지 주소 추가

	HashMap<String, Object> selectAddr(HashMap<String, Object> map); // 유저 마이페이지 주소록 호출

	HashMap<String, Object> updateAddr(HashMap<String, Object> map); // 유저 마이페이지 주소록 수정하기

	HashMap<String, Object> resetDefaultAddress(HashMap<String, Object> map);// 유저 마이페이지 주소록 기본배송지 설정

	HashMap<String, Object> UserDeletDate(HashMap<String, Object> map);// 회원탈퇴로 인한 회원정보 저장 및 회원정보 수정


}
