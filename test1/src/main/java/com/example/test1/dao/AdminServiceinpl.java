package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AdminMapper;
import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;
import com.example.test1.model.User;
import com.siot.IamportRestClient.response.Payment;

@Service
public class AdminServiceinpl implements AdminService {

	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.insertProduct(map);
			resultMap.put("result", "success");
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
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			List<Product> List =  adminMapper.selectProductList(map);
			List<ProductFile> fileList = adminMapper.selectProductFileList(map);

			resultMap.put("list", List);
			resultMap.put("filelist", fileList);
			resultMap.put("reslut", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("reslut", "fail");
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchProductView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Product item = adminMapper.selectProductView(map);
			List<ProductFile> fileList = adminMapper.selectProductContentsFileInfo(map);
			resultMap.put("item", item);
			resultMap.put("filelist", fileList);
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
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
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

	@Override
	public HashMap<String, Object> addProductContentsFile(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			adminMapper.insertProductContentsFile(map);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;

	}
	
	@Override
	public HashMap<String, Object> addProductDetailFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.insertProductDetailFile(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removefile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.fileDelete(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchProductChartList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Product> ProductList = adminMapper.selectProductChart(map);
			resultMap.put("result", "success");
			resultMap.put("ProductList", ProductList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<User> userList = adminMapper.selectUserList(map);
			int cnt = adminMapper.selectUserListCnt(map);
			
			resultMap.put("userList", userList);
			resultMap.put("cnt", cnt);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			User userInfo = adminMapper.selectAdminUserInfo(map);
			if(userInfo == null) {
				resultMap.put("result", "fail");
			}else {
				resultMap.put("userInfo", userInfo);
				resultMap.put("result", "success");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateUserType(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.updateUserType(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		// TODO Auto-generated method stub
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateUserLoginCntZero(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			adminMapper.updateUserLoginCntZero(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<User> userListAll = adminMapper.selectUserListALL(map);
			resultMap.put("userListAll", userListAll);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchPaymentListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Payment> paymentList = adminMapper.selectPaymentList(map);
			resultMap.put("paymentList", paymentList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	

}
