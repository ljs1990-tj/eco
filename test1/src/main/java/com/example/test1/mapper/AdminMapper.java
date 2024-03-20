package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;
import com.example.test1.model.User;
import com.siot.IamportRestClient.response.Payment;

@Mapper
public interface AdminMapper {

	void insertProduct(HashMap<String, Object> map);

	List<Product> selectProductList(HashMap<String, Object> map);

	Product selectProductView(HashMap<String, Object> map);

	void updateProduct(HashMap<String, Object> map);

	void insertProductFile(HashMap<String, Object> map);

	void insertProductContentsFile(HashMap<String, Object> map);
	
	void insertProductDetailFile(HashMap<String, Object> map);

	List<ProductFile> selectProductFileList(HashMap<String, Object> map);

	List<ProductFile> selectProductContentsFileInfo(HashMap<String, Object> map);

	void fileDelete(HashMap<String, Object> map);

	void updateProductMainFile(HashMap<String, Object> map);

	List<Product> selectProductChart(HashMap<String, Object> map);

	List<User> selectUserList(HashMap<String, Object> map);

	User selectAdminUserInfo(HashMap<String, Object> map);

	void updateUserType(HashMap<String, Object> map);

	void updateUserLoginCntZero(HashMap<String, Object> map);

	int selectUserListCnt(HashMap<String, Object> map);
	
	List<User> selectUserListALL(HashMap<String, Object> map);
	
	List<Payment> selectPaymentList(HashMap<String, Object> map);
}
