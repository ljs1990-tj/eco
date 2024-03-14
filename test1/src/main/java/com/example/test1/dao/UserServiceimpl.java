package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Addr;
import com.example.test1.model.User;

@Service
public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Autowired
	BoardMapper boardMapper;

	@Autowired
	HttpSession session;

	// 유저 주소록 추가
	@Override
	public HashMap<String, Object> addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.insertUser(map);
			userMapper.insertUserAddr(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 유저 아이디 중복체크
	@Override
	public HashMap<String, Object> checkUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		if (user == null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("user", user);
		}
		return resultMap;
	}

	// 유저 정보 가져오기
	@Override
	public HashMap<String, Object> getUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			User user = userMapper.selectUser(map);
			resultMap.put("user", user);
			resultMap.put("result", "success");
			List<Board> list = boardMapper.selectUserWriteList(map);
			resultMap.put("list", list);
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저정보 수정
	@Override
	public HashMap<String, Object> modifyUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateUser(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저 주소록 가져오기
	@Override
	public HashMap<String, Object> getAddr(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Addr> addr = userMapper.selectAddr(map);
			resultMap.put("addr", addr);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저 주소 삭제
	@Override
	public HashMap<String, Object> AddrDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.deleteAddr(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저 로그인
	@Override
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUser(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (user == null) { // 아이디가 없는 경우
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		} else { // 아이디가 있는 경우
			String userPw = (String) map.get("userPw");
			if (user.getUserPw().equals(userPw)) {
				resultMap.put("result", "success");
				resultMap.put("message", user.getName() + "님 환영합니다.");
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userType", user.getUserType());
			}
		}

		return resultMap;
	}
	//유저 마이페이지 주소록 추가
		@Override
		public HashMap<String, Object> addAddr(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			try {
				userMapper.insertMyPageAddrAdd(map);
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
				System.out.println(e.getMessage());
			}
			return resultMap;
		}

		//유저 마이페이지 주소록 호출
		@Override
		public HashMap<String, Object> selectAddr(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			try {
				resultMap.put("info",userMapper.selectAddrAddNo(map));
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
				System.out.println(e.getMessage());
			}
			return resultMap;
		}
		//유저 마이페이지 주소록 수정
		@Override
		public HashMap<String, Object> updateAddr(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			try {
				userMapper.updateAddr(map);
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
				System.out.println(e.getMessage());
			}
			return resultMap;
		}
		 
}
