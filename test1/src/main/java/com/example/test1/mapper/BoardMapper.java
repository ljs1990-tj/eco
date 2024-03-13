package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Comment;

@Mapper
public interface BoardMapper {
	
	List<Board> selectBoardList(HashMap<String, Object> map); //리스트보기

	Board selectBoardInfo(HashMap<String, Object> map);//상세보기
	
	void writeBoard(HashMap<String, Object> map); //게시글작성
	
	void insertBoardImage(HashMap<String, Object> map); //첨부파일추가
	
	void deleteBoard(HashMap<String, Object> map); //게시글삭제

	void updateHit(HashMap<String, Object> map); //조회수 증가

	void boardEdit(HashMap<String, Object> map); //게시글 수정
	
	List<Board> selectCustomerInquiryList(HashMap<String, Object> map); //고객 문의 리스트
	
	void insertCustomerInquiry (HashMap<String, Object> map); //고객 문의 작성
	
	Board selectInquiryInfo(HashMap<String, Object> map);//등록한 문의 보기
	
	void deleteInquiry(HashMap<String, Object> map); // 등록한 문의 삭제
	
	void updateInquiry(HashMap<String, Object> map); // 등록한 문의 수정
	
	Comment selectAdminComment(HashMap<String, Object> map); // 문의글에 관리자가 남긴 코멘트 출력 
}
