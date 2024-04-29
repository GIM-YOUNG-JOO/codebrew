package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@RequestMapping("")
	public String productList() {
		log.info("유저 정보 실행");
		return "account/information";
	}
	@RequestMapping("/paymentList")
	public String productRegistration() {
		log.info("주문 내역 실행");
		return "account/paymentList";
	}
}
