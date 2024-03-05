package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;

@Service
public class ProductServiceimpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	HttpSession session;
	
	//제품 리스트
	@Override 
	public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Product> list = productMapper.selectProductList(map);
			
			resultMap.put("list", list);
			resultMap.put("reslut","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("reslut","fail");
		}
		
		return resultMap;
	}
	
	//제품 삭제
	@Override
	public HashMap<String, Object> removeProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			productMapper.deleteProduct(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	
	//제품 상세 조회
	@Override
	public HashMap<String, Object> searchProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Product product =  productMapper.selectProductInfo(map);
			resultMap.put("info", product);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// cord 분류에 따른 제품 리스트
	@Override
	public HashMap<String, Object> searchCodeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Product> list = productMapper.selectCodeList(map);
			List<ProductFile> fileList = productMapper.selectProductFileInfo(map);
			resultMap.put("list", list);
			resultMap.put("filelist", fileList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

}
