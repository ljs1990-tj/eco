package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Comment;
import com.example.test1.model.ProductFile;
import com.example.test1.model.BoardFile;

@Mapper
public interface BoardMapper {
	
	List<Board> selectBoardList(HashMap<String, Object> map); //리스트보기

	Board selectBoardInfo(HashMap<String, Object> map);//상세보기
	
	void writeBoard(HashMap<String, Object> map); //게시글작성
	
	void deleteBoard(HashMap<String, Object> map); //게시글삭제

	void updateHit(HashMap<String, Object> map); //조회수 증가

	void boardEdit(HashMap<String, Object> map); //게시글 수정

	void insertBoardFile(HashMap<String, Object> map); //첨부파일추가
	
	List<BoardFile> selectBoardFileInfo(HashMap<String, Object> map); // 제품 이미지 리스트

	List<BoardFile> selectBoardContentsFileInfo(HashMap<String, Object> map); // 제품 상세보기 이미지

	List<BoardFile> selectBoardDetailFileInfo(HashMap<String, Object> map); // 제품 상세보기에 있는 상세 정보에서 보여줄 이미지
	
	

	
	//고객 문의 리스트
	List<Board> selectCustomerInquiryList(HashMap<String, Object> map);

}


