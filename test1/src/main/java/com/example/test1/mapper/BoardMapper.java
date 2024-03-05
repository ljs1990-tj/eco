package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Comment;
import com.example.test1.model.BoardImage;

@Mapper
public interface BoardMapper {	
	//sql의 게시글 목록 가져오기
	
	List<Board> selectBoardList(HashMap<String, Object> map); //리스트보기

	Board selectBoardInfo(HashMap<String, Object> map);//상세보기
	
	void writeBoard(HashMap<String, Object> map); //게시글작성
	
	void insertBoardImage(HashMap<String, Object> map); //첨부파일추가
	
	void deleteBoard(HashMap<String, Object> map); //게시글삭제

	void updateHit(HashMap<String, Object> map); //조회수 증가
	
	

	
}


