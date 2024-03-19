package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Code;

public interface CodeService {

	List<Code> searchCodeList(HashMap<String, Object> map);

}
