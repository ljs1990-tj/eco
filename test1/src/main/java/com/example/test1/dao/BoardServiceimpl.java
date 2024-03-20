package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.BoardFile;
import com.example.test1.model.Comment;

@Service
public class BoardServiceimpl implements BoardService{
	@Autowired
	BoardMapper boardMapper;


	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list= boardMapper.selectBoardList(map);
		int cnt = boardMapper.selectBoardListCnt(map);
		try {
			resultMap.put("list", list);
			resultMap.put("cnt", cnt);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	
	}

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
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			boardMapper.fileDelete(map);
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
		
		boardMapper.updateHit(map); // 조회수 증가
		
		try {
			Board board = boardMapper.selectBoardInfo(map);// 게시글 상세 조회
			// 1. 이미지 파일 검색
			List<BoardFile> fileList = boardMapper.selectBoardContentsFileInfo(map);
			
			
			//System.out.println("board에 뭐있나여 "+board);
			resultMap.put("info", board);
			// 2. resultMap에 넣기
			resultMap.put("fileList", fileList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			boardMapper.boardEdit(map);
			boardMapper.updateBoardImage(map);
			//resultMap.put("fileList", fileList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	//고객 문의 리스트
	@Override
	public HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Board> list = boardMapper.selectCustomerInquiryList(map);
			
			resultMap.put("list", list);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle 
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//문의 등록
	@Override
	public HashMap<String, Object> addCustomerInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertCustomerInquiry(map);
			
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 조회
	@Override
	public HashMap<String, Object> searchInquiryInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			Board board = boardMapper.selectInquiryInfo(map); //등록한 문의 출력
			
			if(boardMapper.selectInquiryInfo(map) != null) {
				Comment comment = boardMapper.selectAdminComment(map); // 등록된 문의에 관리자가 남긴 코멘트
				resultMap.put("comment", comment);
			}
			
			resultMap.put("info", board);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 삭제
	@Override
	public HashMap<String, Object> removeInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteInquiry(map);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 수정
	@Override
	public HashMap<String, Object> editInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateInquiry(map);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			boardMapper.insertBoardFile(map);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoardContentsFile(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			boardMapper.insertBoardContentsFile(map);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;

	}

	@Override
	public HashMap<String, Object> searchBoardFileList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<BoardFile> boardFile = boardMapper.selectBoardFileList(map);
			resultMap.put("result", "success");
			resultMap.put("boardFile", boardFile);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}


	
	// 메인 페이지용 레시피 게시글 출력
	@Override
	public HashMap<String, Object> searchBoardAndFileList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Board> list= boardMapper.selectBoardList2(map);
			List<BoardFile> fileList = boardMapper.selectBoardFileList2(map);
			resultMap.put("listR", list);
			resultMap.put("fileListR", fileList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	
	
}
