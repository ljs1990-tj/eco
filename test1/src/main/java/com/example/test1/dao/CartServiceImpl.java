package com.example.test1.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CartMapper; // basketMapper를 CartMapper로 변경
import com.example.test1.model.Cart; // basketVO를 Cart로 변경
import com.example.test1.model.CartPage;
import com.example.test1.model.Code;
import com.example.test1.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService{ 
    
   @Autowired
   CartMapper cartMapper;
	/*
	 * @Override public List<Cart> getList(Criteria cri, Long userId) { try { return
	 * CartMapper.getList(cri, userId); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } }
	 * 
	 * @Override public int addOrUpdateCartProduct(Cart cart) { // getBasketProduct를
	 * addOrUpdateCartProduct로 변경 try { return
	 * CartMapper.addOrUpdateCartProduct(cart); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } }
	 * 
	 * @Override public CartPage getCartPage(Criteria cri, Long userId) { //
	 * getListPage를 getCartPage로 변경 try { return new
	 * CartPage(CartMapper.getCartCount(userId), CartMapper.getList(cri, userId)); }
	 * catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace();
	 * } }
	 * 
	 * @Override public int getCartCount(Long userId) { // customer_code를 userId로 변경
	 * try { return CartMapper.getCartCount(userId); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } }
	 * 
	 * @Override public Code checkCartItemExists(int itemNo, long userId) { return
	 * CartMapper.checkCartItemExists(itemNo, userId); }
	 * 
	 * @Override public int removeCartItem(Long userId, int itemNo) { return
	 * CartMapper.removeCartItem(userId, itemNo); }
	 * 
	 * @Override public List<GetOrderInfo> getOrderInfo(Long userId, Integer[]
	 * checkedItems) { return CartMapper.getOrderInfo(userId, checkedItems); }
	 * 
	 * @Override public int getTotalPrice(Long userId, Integer[] checkedItems) {
	 * return CartMapper.getTotalPrice(userId, checkedItems); }
	 * 
	 * @Override public OrderInfoList getOrderInfoList(Long userId, Integer[]
	 * checkedItems) { return new OrderInfoList(CartMapper.getOrderInfo(userId,
	 * checkedItems), CartMapper.getTotalPrice(userId, checkedItems)); }
	 */

	@Override
	public List<Cart> getList(Criteria cri, Long userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int addOrUpdateCartProduct(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public CartPage getCartPage(Criteria cri, Long userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getCartCount(Long userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Code checkCartItemExists(int itemNo, long userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int removeCartItem(Long userId, int itemNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int getTotalPrice(Long userId, Integer[] checkedItems) {
		// TODO Auto-generated method stub
		return 0;
	}
}
