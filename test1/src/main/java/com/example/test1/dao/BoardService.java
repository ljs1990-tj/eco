package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {

	HashMap<String, Object> searchBoardList(HashMap<String, Object> map); //게시글 목록
	
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map); //게시글 상세보기
	
	HashMap<String, Object> writeBoardList(HashMap<String, Object> map); //게시글 작성
	
	HashMap<String, Object> removeBoard(HashMap<String, Object> map); //게시글 삭제
	
	HashMap<String, Object> editBoard(HashMap<String, Object> map); //게시글 수정
	
	HashMap<String, Object> inBoardImage(HashMap<String, Object> map); //첨부파일 삽입
	
	
	
	HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map); //고객 문의 리스트
	
	HashMap<String, Object> addCustomerInquiry(HashMap<String, Object> map); //고객 문의 작성
	
	HashMap<String, Object> searchInquiryInfo(HashMap<String, Object> map); //등록한 문의 정보 확인 

	HashMap<String, Object> removeInquiry(HashMap<String, Object> map); //등록한 문의 삭제
	
	HashMap<String, Object> editInquiry(HashMap<String, Object> map); //등록한 문의 수정
	
	
}
