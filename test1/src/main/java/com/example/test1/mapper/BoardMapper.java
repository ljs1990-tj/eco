package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	//고객 문의 리스트
	List<Board> selectCustomerInquiryList(HashMap<String, Object> map);

}

