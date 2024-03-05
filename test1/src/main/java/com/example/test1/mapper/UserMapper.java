package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;


@Mapper
public interface UserMapper {
	User selectUser(HashMap<String, Object> map); // 유저 찾기
	void insertUser(HashMap<String, Object> map); // 유저 회원가입
	void updateUser(HashMap<String, Object> map); // 유저 정보수정
}
