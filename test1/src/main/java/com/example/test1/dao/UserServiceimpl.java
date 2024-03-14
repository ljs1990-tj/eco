package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Addr;
import com.example.test1.model.User;

@Service
public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper userMapper;

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
			resultMap.put("message", "존재하지 않는 아이디입니다!");
		} else { // 아이디가 있는 경우
			String userPw = (String) map.get("userPw");
			if (user.getUserPw().equals(userPw)) {
				if (user.getLoginCnt() >= 5) { // 로그인 실패 횟수가 5회 넘은 경우
					resultMap.put("result", "fail");
					resultMap.put("message", "로그인 시도가 5회가 넘어 로그인할 수 없습니다! 관리자에게 직접 문의하여 해결하세요!");
				} else {
					userMapper.updateLoginCnt2(map); // 로그인 성공 시 카운트 초기화
					resultMap.put("result", "success");
					resultMap.put("message", user.getName() + "님 환영합니다!");
					// ↓ 세션 설정
					session.setAttribute("userId", user.getUserId());
					session.setAttribute("userName", user.getName());
					session.setAttribute("userType", user.getUserType());
				}
			} else {
				if (!"A".equals(user.getUserType())) {
					if (user.getLoginCnt() >= 5) { // 로그인 실패 횟수가 5회 넘은 경우
						resultMap.put("result", "fail");
						resultMap.put("message", "로그인 시도가 5회가 넘어 로그인할 수 없습니다! 관리자에게 직접 문의하여 해결하세요!");
					} else {
						userMapper.updateLoginCnt(map); // 로그인 실패 시 카운트 증가
						resultMap.put("result", "fail");
						resultMap.put("message",
								"비밀번호를 " + (user.getLoginCnt() + 1) + " 회 틀렸습니다! 5회 실패 시 로그인이 불가합니다!");
					}
				} else {
					resultMap.put("result", "fail");
					resultMap.put("message", "비밀번호를 틀렸습니다, 관리자님!");
				}
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

		// 유저 비밀번호 수정
		@Override
		public HashMap<String, Object> modifyUserPw(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			try {
				userMapper.updateUserPw(map);
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
				System.out.println(e.getMessage());
			}
			return resultMap;
		}
		 
}
