package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AdminMapper;
import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;





@Service
public class AdminServiceinpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.insertProduct(map);
			resultMap.put("result","success");
			resultMap.put("itemNo", map.get("itemNo"));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		try {
			List<Product> List =  adminMapper.selectProductList(map);
			List<ProductFile> fileList = adminMapper.selectProductFileInfo(map);
			resultMap.put("list", List);
			resultMap.put("filelist",fileList);
			resultMap.put("reslut","success");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("reslut","fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchProductView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		try {
			Product item = adminMapper.selectProductView(map);
			resultMap.put("item",item);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		try {
			
			adminMapper.updateProduct(map);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addProductFile(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			adminMapper.insertProductFile(map);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}
