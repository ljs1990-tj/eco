package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.CommentService;
import com.google.gson.Gson;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	@Autowired
	HttpSession session;
	
	//관리자 답글
	@RequestMapping(value = "/adminCommentInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminCommentInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = commentService.addAdminComment(map);
		return new Gson().toJson(resultMap);
	}


}