package com.example.test1.model;

import lombok.Data;

@Data
public class BoardImage {
	int fileNo;
	int boardNo;
	String filePath;
	String fileName;
	String fileOrgName;
	String fileSize;
	String fileEtc;
	String kind;
}