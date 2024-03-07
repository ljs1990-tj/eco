package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CodeMapper;
import com.example.test1.model.Code;

@Service
public class CodeServiceimpl implements CodeService{

	@Autowired
	CodeMapper codeMapper;
	
	@Override
	public List<Code> searchCodeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Code> codeList = null;
		try {
			codeList = codeMapper.selectCodeList(map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return codeList;
	}

}
