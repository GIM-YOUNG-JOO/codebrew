package com.mycompany.codebrew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.service.ProductRegistrationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ProductRegistrationService prService;
	
	@RequestMapping("/productList")
	public String productList() {
		log.info("상품 목록 실행");
		return "admin/productList";
	}
	
	@GetMapping("/productRegistration")
	public String productRegistration() {
		log.info("상품 등록 실행");
		return "admin/productRegistration";
	}
	
	@RequestMapping("/productDelete")
	public String productDelete() {
		log.info("상품 삭제 실행");
		return "admin/productDelete";
	}
	
	@PostMapping("/RegistComplete")
	public String RegistComplete(Product product) {
		//요청 데이터의 유효성 검사
		//로그인이 필요한지 조사
		//product.setPcId(pcId);
		//비즈니스 로직 처리를 서비스로 위임
		log.info("" + product.getPrprice());
		prService.RegistComplete(product);
		return "redirect:/";
	}
}
