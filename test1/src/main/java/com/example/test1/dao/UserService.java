package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	HashMap<String, Object> addUser(HashMap<String, Object> map); // 유저 회원가입
	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 유저 아이디 중복체크
}
