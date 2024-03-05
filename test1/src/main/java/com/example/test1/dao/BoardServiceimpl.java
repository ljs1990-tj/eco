package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.BoardImage;
import com.example.test1.model.Comment;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> board = new HashMap<String, Object>();
		try {
			List<Board> list= boardMapper.selectBoardList(map);
			board.put("list", list);
			board.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			board.put("result", "fail");
		}
		return board;
	
	}

	/*
	 * @Override public HashMap<String, Object> searchBoardInfo(HashMap<String,
	 * Object> map) { // TODO Auto-generated method stub HashMap<String, Object>
	 * resultMap = new HashMap<String, Object>(); //String str = (String)
	 * map.get("str");
	 * 
	 * Board board = boardMapper.selectBoardInfo(map);// 게시글 상세 조회 //List<BoardFile>
	 * fileList = boardMapper.boardFileList(map);//파일 목록 //List<Comment> commentList
	 * = boardMapper.selectCommentInfo(map);//댓글 목록 조회
	 * 
	 * resultMap.put("list", board); //resultMap.put("fileList", fileList);
	 * //resultMap.put("commentList", commentList);//댓글 목록 조회 //
	 * resultMap.put("pCommentList", pCommentList); //대댓글 작성해보기
	 * resultMap.put("result", "success"); return resultMap;
	 * 
	 * }
	 */

	@Override
	public HashMap<String, Object> writeBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.writeBoard(map);
		//	boardMapper.insertBoardFile(map);
			resultMap.put("boardNo", map.get("BOARDNO"));
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> inBoardImage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());//try catch 사용할때 필수로 넣기 에러봐야되니깐
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//boardMapper.updateHit(map); // 조회수 증가
		try {
			Board board = boardMapper.selectBoardInfo(map);// 게시글 상세 조회
			System.out.println(board);
			resultMap.put("info", board);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
