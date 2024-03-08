package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.CodeService;
import com.example.test1.model.Code;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	// mapper의 이름과 동일하게 작성하기

	@Autowired
	BoardService boardService;

	@Autowired
	HttpSession session;

	@Autowired
	CodeService codeService;

	@RequestMapping("/boardList.do") //목록보기
	public String boardList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		map.put("kind", "board");
		List<Code> codeList = codeService.searchCodeList(map);
		
		request.setAttribute("boardList", new Gson().toJson(codeList));
		request.setAttribute("map", map);
		return "/board-list";
	}

	@RequestMapping("/boardView.do")//상세보기
	public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		// request의 HttpServletRequest
		
		request.setAttribute("map", map);
		return "/board-view";
	}
	
	@RequestMapping("/boardInsert.do") //게시글 작성
	public String insertList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/board-insert";
	}
	
	@RequestMapping("/boardDelete.do") //게시글 삭제
	public String inserBbsList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/board-delete";
	}
	
	@RequestMapping("/boardEdit.do") //게시글 수정
	public String editList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		
		return "/board-edit";
	}
	
	@RequestMapping(value = "/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/boardInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.writeBoardList(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/boardDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.removeBoard(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/boardEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/customerService.do")
	public String productOrganic(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/customer-service";
	}
}
