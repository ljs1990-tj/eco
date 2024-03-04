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

	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> writeBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> inBoardImage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


}
