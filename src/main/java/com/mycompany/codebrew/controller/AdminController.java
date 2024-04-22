package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("/productList")
	public String productList() {
		log.info("상품 목록 실행");
		return "admin/productList";
	}
	@RequestMapping("/productRegistration")
	public String productRegistration() {
		log.info("상품 등록 실행");
		return "admin/productRegistration";
	}
	
	@RequestMapping("/productDelete")
	public String productDelete() {
		log.info("상품 삭제 실행");
		return "admin/productDelete";
	}
}
