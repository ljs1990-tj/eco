package com.example.test1.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CommentMapper;

@Service
public class CommentServiceimpl implements CommentService{

	@Autowired
	CommentMapper commentMapper;
	
	

}
