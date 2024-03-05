package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.test1.model.Code;
import com.example.test1.model.Criteria;

import com.example.test1.model.Cart;
import com.example.test1.model.CartPage;

public interface CartMapper { // basketMapper를 CartMapper로 변경

    // 사용자별 장바구니 목록을 페이징 조건에 맞게 가져옵니다.
    public List<Cart> getList(@Param("cri") Criteria cri, @Param("userId") Long userId); // customerCode를 userId로 변경

    // 장바구니에 상품을 추가하거나 기존 상품 정보를 업데이트합니다.
    public int addOrUpdateCartProduct(Cart cart); // getBasketProduct를 addOrUpdateCartProduct로 변경, 메소드 시그니처 및 파라미터는 동일하게 유지

    // 페이징 처리를 포함하여 사용자의 장바구니 목록 페이지 정보를 가져옵니다.
    public CartPage getCartPage(Criteria cri, Long userId); // getListPage를 getCartPage로 변경, customer_code를 userId로 변경

    // 사용자의 장바구니에 담긴 상품 개수를 카운트합니다.
    public int getCartCount(Long userId); // customer_code를 userId로 변경

    // 특정 상품이 사용자의 장바구니에 이미 존재하는지 확인합니다.
    public Code checkCartExists(@Param("itemNo") int itemNo, @Param("userId") Long userId); // getPK를 checkCartExists로 변경, 파라미터명 변경

    // 장바구니에서 특정 상품을 삭제합니다.
    public int removeCartProduct(@Param("userId") Long userId, @Param("itemNo") int itemNo); // removeBasket를 removeCartProduct로 변경, 파라미터명 및 순서 변경

    // 사용자의 장바구니에서 선택된 상품들에 대한 주문 정보를 가져옵니다.
    public List<GetOrderInfo> getOrderInfo(@Param("userId") Long userId, @Param("checkedItems") Integer[] checkedItems); // CheckedArray를 checkedItems로 변경, customer_code를 userId로 변경

    // 선택된 상품들의 총 가격을 계산합니다.
    public int getTotalPrice(@Param("userId") Long userId, @Param("checkedItems") Integer[] checkedItems); // CheckedArray를 checkedItems로 변경, customer_code를 userId로 변경
}
