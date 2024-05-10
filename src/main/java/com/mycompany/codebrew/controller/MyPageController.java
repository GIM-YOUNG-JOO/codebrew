package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@GetMapping("/myInfo")
	public String myInfo() {
		log.info("마이페이지 내 정보 실행");
		return "mypage/myInfo";
	}
}
