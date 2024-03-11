package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
	
	//고객 문의 리스트
	HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map);

	HashMap<String, Object> searchBoardList(HashMap<String, Object> map); //게시글 목록
	
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map); //게시글 상세보기
	
	HashMap<String, Object> writeBoardList(HashMap<String, Object> map); //게시글 작성
	
	HashMap<String, Object> removeBoard(HashMap<String, Object> map); //게시글 삭제
	
	HashMap<String, Object> editBoard(HashMap<String, Object> map); //게시글 수정
	
	HashMap<String, Object> inBoardFile(HashMap<String, Object> map); //첨부파일 삽입
	
	
	
}
