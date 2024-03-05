package com.example.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.test1.dao.CartService;

import com.example.test1.model.Cart;
import com.example.test1.model.CartPage;
import com.example.test1.model.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class CartController { // basketController를 CartController로 변경

	@Autowired
    CartService cartService;

    @GetMapping(value = "/myPage/cart/{userId}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<CartPage> getList(@PathVariable("userId") Long userId, @PathVariable("page") int page) {
        Criteria cri = new Criteria(page, 6);

        return new ResponseEntity<>(cartService.getCartPage(cri, userId), HttpStatus.OK);
    }

    @PostMapping(value = "/myPage/cart/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> addCartProduct(@RequestBody Cart cart) {

        int insertCount = cartService.addOrUpdateCartProduct(cart);

        if (insertCount == 1) {
            return new ResponseEntity<>("장바구니에 상품을 추가했습니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping(value = "/myPage/cart/delete/{userId}/{itemNo}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> removeCartProduct(@PathVariable("userId") Long userId, @PathVariable("itemNo") int itemNo) {

        int removeResult = cartService.removeCartItem(userId, itemNo);

        return removeResult == 1 ? new ResponseEntity<>("장바구니에서 상품을 제거했습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
