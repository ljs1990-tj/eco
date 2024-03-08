package com.example.test1.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.test1.dao.KakaoPayService;
import com.example.test1.model.KakaoApproveResponse;
import com.example.test1.model.KakaoReadyResponse;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayController {

	private KakaoPayService kakaoPayService;

	/**
	 * 결제요청
	 */
	@PostMapping("/ready")
	public KakaoReadyResponse readyToKakaoPay() {

		return kakaoPayService.kakaoPayReady();
	}

	/**
	 * 결제 성공
	 */
	/*
	 * @GetMapping("/success") public ResponseEntity
	 * afterPayRequest(@RequestParam("pg_token") String pgToken) {
	 * 
	 * KakaoApproveResponse kakaoApprove = kakaoPayService.approveResponse(pgToken);
	 * 
	 * return new ResponseEntity<>(kakaoApprove, HttpStatus.OK); }
	 * 
	 *//**
		 * 결제 진행 중 취소
		 */
	/*
	 * @GetMapping("/cancel") public void cancel() {
	 * 
	 * throw new BusinessLogicException(ExceptionCode.PAY_CANCEL); }
	 * 
	 *//**
		 * 결제 실패
		 *//*
			 * @GetMapping("/fail") public void fail() {
			 * 
			 * throw new BusinessLogicException(ExceptionCode.PAY_FAILED); }
			 */
}
