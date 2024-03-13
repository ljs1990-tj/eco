package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Code;

@Mapper
public interface CommentMapper {

	// 관리자 문의 내용 답글 달기
	void insertAdminComment(HashMap<String, Object> map);

}
