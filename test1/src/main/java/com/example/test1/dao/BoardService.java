package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {

	HashMap<String, Object> searchBoardList(HashMap<String, Object> map); // 게시글 목록

	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map); // 게시글 상세보기

	HashMap<String, Object> writeBoardList(HashMap<String, Object> map); // 게시글 작성

	HashMap<String, Object> removeBoard(HashMap<String, Object> map); // 게시글 삭제

	HashMap<String, Object> editBoard(HashMap<String, Object> map); // 게시글 수정

	HashMap<String, Object> addBoardFile(HashMap<String, Object> map);// 상품 썸네일 이미지 추가

	HashMap<String, Object> addBoardContentsFile(HashMap<String, Object> map);// 상품 컨텐츠 이미지 추가

	HashMap<String, Object> searchBoardFileList(HashMap<String, Object> map);// 파일 출력

	HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map); // 고객 문의 리스트

	HashMap<String, Object> addCustomerInquiry(HashMap<String, Object> map); // 고객 문의 작성

	HashMap<String, Object> searchInquiryInfo(HashMap<String, Object> map); // 등록한 문의 정보 확인

	HashMap<String, Object> removeInquiry(HashMap<String, Object> map); // 등록한 문의 삭제

	HashMap<String, Object> editInquiry(HashMap<String, Object> map); // 등록한 문의 수정
	
	HashMap<String, Object> searchBoardAndFileList(HashMap<String, Object> map); //게시글과 파일 목록
	

}
