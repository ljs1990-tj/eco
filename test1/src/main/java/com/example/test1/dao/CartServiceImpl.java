package com.example.test1.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CartMapper;


@Service
public class CartServiceImpl implements CartService{ 
    
   @Autowired
   CartMapper cartMapper;
	
}
