package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Product;

@Service
public class BoardServiceimpl implements BoardService{
	@Autowired
	BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Board> list = boardMapper.selectCustomerInquiryList(map);
			
			resultMap.put("list", list);
			resultMap.put("reslut","success");
		} catch (Exception e) {
			// TODO: handle 
			System.out.println(e.getMessage());
			resultMap.put("reslut","fail");
		}
		return resultMap;
	}

	
	
	
	
}
