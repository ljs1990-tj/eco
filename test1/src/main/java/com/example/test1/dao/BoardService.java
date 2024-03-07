package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {

	HashMap<String, Object> searchBoardList(HashMap<String, Object> map); //게시글 목록
	
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map); //게시글 상세보기
	
	HashMap<String, Object> writeBoardList(HashMap<String, Object> map); //게시글 작성
	
	HashMap<String, Object> removeBoard(HashMap<String, Object> map); //게시글 삭제
	
	HashMap<String, Object> editBoard(HashMap<String, Object> map); //게시글 수정
	
	HashMap<String, Object> inBoardImage(HashMap<String, Object> map); //첨부파일 삽입
	
	
}
