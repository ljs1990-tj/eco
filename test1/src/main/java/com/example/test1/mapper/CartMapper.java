package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Addr;
import com.example.test1.model.Cart;
import com.example.test1.model.ProductFile;

@Mapper
public interface CartMapper {

	List<Cart> selectCartList(HashMap<String, Object> map);

	void insertCart(HashMap<String, Object> map);//장바구니에 새로운 항목을 추가
	int selectCartCheck(HashMap<String, Object> map); // 카트에 이미 담겨있는 item인지 확인하는 쿼리
	void updateCartSelect(HashMap<String, Object> map); //카트에 이미 담겨있는게 확인될 경우 실행해야 하는 쿼리 ( 이미 항목이 있으면 cnt 갯수만 1 추가해줌 )
	
	void removeCart(HashMap<String, Object> map);//장바구니에서 해당 cartNo의 행을 제거
	List<ProductFile> selectCartFile(HashMap<String, Object> map); //장바구니의 항목들의 이미지를 가져옴
	void updateSelectCnt(HashMap<String, Object> map); // 장바구니에서 유저가 입력한 수 만큼의 선택갯수를 증가
	void paymentEnd(HashMap<String, Object> map); // 결제가 완료된 항목을 카트에서 제거 
	void updatePaymentEndUser(HashMap<String, Object> map); // eco_user 테이블에서 유저가 사용한 토탈금액 정산
	void insertProductChart(HashMap<String, Object> map); //차트게 결제금액 인서트
	int selectChartCheck(HashMap<String, Object> map); // 차트에 데이터를 insert 할지 update 할지 구분해줄 함수
	void updateProductChart(HashMap<String, Object> map); // 차트에 결제금액 업데이트
	void insertPaymentHistory(HashMap<String, Object> map); // 결제로그 남기기
	List<Cart> selectFavoriteList(HashMap<String, Object> map); // 찜목록 가져오기
	List<Addr> selectAddrList(HashMap<String, Object> map);//주소 목록 가져오기
	void insertFavorite(HashMap<String, Object> map); // 찜목록에 추가
	int selectFavoriteCheck(HashMap<String, Object> map); //찜목록에 있는지 확인
	void removeFavorite(HashMap<String, Object> map);//찜목록에서 제거
	void PaymentEndUpdateProduct(HashMap<String,Object> map);// 결제완료후 상품의 cnt와 sellcnt 업데이트
	
}
