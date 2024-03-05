package com.example.test1.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.example.test1.model.Code;
import com.example.test1.model.Criteria;
import com.example.test1.model.Cart;
import com.example.test1.model.CartPage;

public interface CartService {

    // 주어진 사용자와 기준에 따라 장바구니 항목 목록을 검색합니다 (페이지네이션 포함).
    public List<Cart> getList(@Param("cri") Criteria cri, @Param("userId") Long userId); // 'customer_code'를 'userId'로 가정

    // 장바구니에 상품을 추가하거나 업데이트합니다.
    public int addOrUpdateCartProduct(Cart cart); // 이 메소드가 장바구니 항목을 추가하거나 업데이트한다고 가정

    // 주어진 사용자를 위한 페이징된 장바구니 항목 목록과 전체 수를 검색합니다.
    
	 public CartPage getCartPage(@Param("cri") Criteria cri, @Param("userId") Long userId);
    
    // 사용자의 장바구니에 있는 항목 수를 계산합니다.
    public int getCartCount(@Param("userId") Long userId); 

    // 주어진 항목 번호와 사용자 ID로 이미 존재하는 장바구니 항목이 있는지 확인합니다.
    public Code checkCartItemExists(@Param("itemNo") int itemNo, @Param("userId") long userId); // 'getPK'를 'checkCartItemExists'로 이름 변경

    // 장바구니에서 상품을 제거합니다.
    public int removeCartItem(@Param("userId") Long userId, @Param("itemNo") int itemNo);
    
    // 사용자의 장바구니에서 선택된 항목들에 대한 주문 정보를 검색합니다.
	
	  public List<GetOrderInfo> getOrderInfo(@Param("userId") Long
	  userId, @Param("checkedItems") Integer[] checkedItems); 
	 
    // 주문 확인이나 요약을 위해 선택된 항목들에 대한 자세한 주문 정보 목록을 검색합니다.
	/*
	 * public OrderInfoList getOrderInfoList(@Param("userId") Long
	 * userId, @Param("checkedItems") Integer[] checkedItems); // 'CheckedArray'를
	 * 'checkedItems'로 변경
	 */
    // 사용자의 장바구니에서 선택된 항목들에 대한 총 가격을 계산합니다.
    public int getTotalPrice(@Param("userId") Long userId, @Param("checkedItems") Integer[] checkedItems); 
}
