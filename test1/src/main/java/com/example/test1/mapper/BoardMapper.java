package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.BoardFile;
import com.example.test1.model.Comment;

@Mapper
public interface BoardMapper {
	
	List<Board> selectBoardList(HashMap<String, Object> map); //리스트보기
	
	int selectBoardListCnt(HashMap<String, Object> map);//게시글 개수 조회

	Board selectBoardInfo(HashMap<String, Object> map);//상세보기
	
	void writeBoard(HashMap<String, Object> map); //게시글작성
	
	void deleteBoard(HashMap<String, Object> map); //게시글삭제

	void updateHit(HashMap<String, Object> map); //조회수 증가

	void boardEdit(HashMap<String, Object> map); //게시글 수정
	
	
	void insertBoardFile(HashMap<String,Object> map);
	
	void insertBoardContentsFile (HashMap<String,Object> map);
	
	List<BoardFile> selectBoardFileList(HashMap<String, Object> map);
	
	List<BoardFile> selectBoardContentsFileInfo(HashMap<String, Object> map);
	
	void fileDelete(HashMap<String, Object> map);
	
	void updateBoardImage(HashMap<String, Object >map);
	
	List<Board> selectUserWriteList(HashMap<String, Object> map);

	
	List<Board> selectCustomerInquiryList(HashMap<String, Object> map); //고객 문의 리스트
	
	void insertCustomerInquiry (HashMap<String, Object> map); //고객 문의 작성
	
	Board selectInquiryInfo(HashMap<String, Object> map);//등록한 문의 보기
	
	void deleteInquiry(HashMap<String, Object> map); // 등록한 문의 삭제
	
	void updateInquiry(HashMap<String, Object> map); // 등록한 문의 수정
	
	Comment selectAdminComment(HashMap<String, Object> map); // 문의글에 관리자가 남긴 코멘트 출력
	
	List<Board> selectBoardList2(HashMap<String, Object> map); // 메인 페이지용 레시피 게시글 출력
	List<BoardFile> selectBoardFileList2(HashMap<String, Object> map); // 메인 페이지용 레시피 게시글 이미지 출력
}

