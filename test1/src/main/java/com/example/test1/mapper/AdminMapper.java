package com.example.test1.mapper;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;
import com.example.test1.model.ProductFile;

@Mapper
public interface AdminMapper {
	
	void insertProduct(HashMap<String, Object> map);
	List<Product> selectProductList(HashMap<String, Object> map);
	
	Product selectProductView(HashMap<String, Object> map);
	
	void updateProduct(HashMap<String,Object> map);
	
	void insertProductFile(HashMap<String,Object> map);
	
	void insertProductContentsFile (HashMap<String,Object> map);
	List<ProductFile> selectProductFileList(HashMap<String, Object> map);
	List<ProductFile> selectProductContentsFileInfo(HashMap<String, Object> map);
	void fileDelete(HashMap<String, Object> map);
	void updateProductMainFile(HashMap<String, Object >map );
}

