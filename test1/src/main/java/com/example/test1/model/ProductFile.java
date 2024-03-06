package com.example.test1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
public class ProductFile {
	private int itemNo;
	private String fileNo;
	private String filePath;
	private String fileName;
	private String fileOrgName;
	private String fileSize;
	private String fileEtc;
	private String path;
	private String kind;
}
