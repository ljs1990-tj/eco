package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Addr;
import com.example.test1.model.Cart;
import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	User selectUser(HashMap<String, Object> map); // 유저 찾기

	void insertUser(HashMap<String, Object> map); // 유저 회원가입

	User selectUserPhone(HashMap<String, Object> map); // 유저 찾기

	void updateUserPw(HashMap<String, Object> map); // 유저 비밀번호 수정

	void updateUser(HashMap<String, Object> map); // 유저 정보수정

	void insertUserAddr(HashMap<String, Object> map); // 유저 회원가입

	List<Addr> selectAddr(HashMap<String, Object> map); // 유저 주소록 가져오기

	void deleteAddr(HashMap<String, Object> map); // 유저 주소 삭제

	void insertMyPageAddrAdd(HashMap<String, Object> map); // 유저 마이페이지 주소 추가

	Addr selectAddrAddNo(HashMap<String, Object> map); // 유저 마이페이지 주소록 가져오기

	void updateAddr(HashMap<String, Object> map); // 유저 마이페이지 주소록 수정하기

	void updateDefaultAddressToN(HashMap<String, Object> map);// 유저 마이페이지 주소록 배송지 N초기화

	void updateAddressToDefault(HashMap<String, Object> map);// 유저 마이페이지 주소록 배송지 기본으로 설정

	void updateLoginCnt(HashMap<String, Object> map); // 로그인 실패 시 카운트 증가

	void updateLoginCnt2(HashMap<String, Object> map); // 로그인 성공 시 카운트 초기화

	int selectCartCnt(HashMap<String, Object> map); // 로그인 성공 시 카운트 초기화
	int selectFavoriteCnt(HashMap<String, Object> map); // 로그인 성공 시 카운트 초기화
	
	void updateUserDeleteDate(HashMap<String, Object> map); //회원탈퇴로 인한 ECO_USER 회원정보수정
	
	void insertUserDeleteDate(HashMap<String, Object> map); //회원탈퇴로 인한 ECO_USER_DELETE 정보저장
	
	void updateUserAuthYn(HashMap<String, Object> map); //로그인시 문자 인증하면 AuthYn 변경
	
	void updateUserDeleteCancle(HashMap<String, Object> map);//회원 탈퇴 취소하기
	
	void deleteUserDeleteCancle(HashMap<String, Object> map);//회원 탈퇴 취소하기
	
	void updateUserGrade(HashMap<String, Object> map); // 유저 등급 갱신
  
  List<Cart> selectUserPaymentHistory(HashMap<String, Object> map); // 회원이 구매한 목록 가져오기
}
