package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
	
	//고객 문의 리스트
	HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map);

}
