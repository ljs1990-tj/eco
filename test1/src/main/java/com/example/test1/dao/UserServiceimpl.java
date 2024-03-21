package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Addr;
import com.example.test1.model.Board;
import com.example.test1.model.Cart;
import com.example.test1.model.User;

@Service
public class UserServiceimpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Autowired
	BoardMapper boardMapper;

	@Autowired
	HttpSession session;

	// 유저 회원가입
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
			int cartCnt = userMapper.selectCartCnt(map);
			int favoriteCnt = userMapper.selectFavoriteCnt(map);
			resultMap.put("result", "fail");
			resultMap.put("user", user); // 비밀번호 찾기용 유저 정보 담기
			resultMap.put("cartCnt", cartCnt); // 장바구니 개수 확인용
			resultMap.put("favoriteCnt", favoriteCnt); // 찜 개수 확인용
		}
		return resultMap;
	}

	// 유저 정보 가져오기
	@Override
	public HashMap<String, Object> getUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//List<Cart> userList = userMapper.selectUserPaymentHistory(map);
		List<Board> list = boardMapper.selectUserWriteList(map);
		User user = userMapper.selectUser(map);
		List<Addr> addr = userMapper.selectAddr(map);
		try {
			resultMap.put("user", user);
			resultMap.put("addr", addr);
			resultMap.put("list", list);
			//resultMap.put("list", userList);
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
					resultMap.put("user", user);
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
						resultMap.put("message", "비밀번호를 " + (user.getLoginCnt() + 1) + " 회 틀렸습니다! 5회 실패 시 로그인이 불가합니다!");
					}
				} else {
					resultMap.put("result", "fail");
					resultMap.put("message", "비밀번호를 틀렸습니다, 관리자님!");
				}
			}
		}
		return resultMap;
	}

	// 유저 마이페이지 주소록 추가
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

	// 유저 마이페이지 주소록 수정
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

	// 유저 마이페이지 주소록 기본배송지 N초기화 및 선택한 번호 기본 배송지
	@Override
	public HashMap<String, Object> resetDefaultAddress(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateDefaultAddressToN(map);
			userMapper.updateAddressToDefault(map);
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

	// 폰 번호로 아이디 찾기
	@Override
	public HashMap<String, Object> checkUserPhone(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			User user = userMapper.selectUserPhone(map);
			resultMap.put("result", "success");
			resultMap.put("user", user);
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 회원탈퇴하여 다른 테이블에 저장 기간 6달
	@Override
	public HashMap<String, Object> UserDeletDate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateUserDeleteDate(map);
			userMapper.insertUserDeleteDate(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 로그인시 문자 인증하면 AuthYn 변경
	@Override
	public HashMap<String, Object> AuthYnupdateUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateUserAuthYn(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저 마이페이지 패스워드 변경
	@Override
	public HashMap<String, Object> PasswordChage(HashMap<String, Object> map) {
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

	// 회원 탈퇴 취소하기
	@Override
	public HashMap<String, Object> CancleupdateUserDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateUserDeleteCancle(map);
			userMapper.deleteUserDeleteCancle(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// 유저 페이지 상세보기 전 비밀번호 확인
	@Override
	public HashMap<String, Object> checkPassword(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);

		// 사용자가 존재하지 않는 경우
		if (user == null) {
			resultMap.put("result", "fail");
			resultMap.put("message", "존재하지 않는 아이디입니다!");
			return resultMap;
		}

		// 입력된 비밀번호가 일치하는 경우
		if (user.getUserPw().equals(map.get("userPw"))) {
			if (user.getLoginCnt() >= 5) {
				resultMap.put("result", "fail");
				resultMap.put("message", "로그인 시도가 5회가 넘어 로그인할 수 없습니다! 관리자에게 직접 문의하여 해결하세요!");
			} else {
				userMapper.updateLoginCnt2(map);
				resultMap.put("user", user);
				resultMap.put("result", "success");
			}
		} else { // 비밀번호가 일치하지 않는 경우
			if (!"A".equals(user.getUserType())) {
				if (user.getLoginCnt() >= 5) {
					resultMap.put("user", user);
					resultMap.put("result", "fail");
					resultMap.put("message", "로그인 시도가 5회가 넘어 로그인할 수 없습니다! 관리자에게 직접 문의하여 해결하세요!");
				} else {
					userMapper.updateLoginCnt(map);
					int remainingAttempts = 5 - user.getLoginCnt();
					resultMap.put("result", "fail");
					resultMap.put("message", "비밀번호를 틀렸습니다! 남은 시도 횟수: " + remainingAttempts);
				}
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호를 틀렸습니다, 관리자님!");
			}
		}

		return resultMap;
	}
	
	//유저 등급 갱신
	@Override
	public HashMap<String, Object> editUserGrade(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.updateUserGrade(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			System.out.println(e.getMessage());
		}
		
		return resultMap;
	}

}
