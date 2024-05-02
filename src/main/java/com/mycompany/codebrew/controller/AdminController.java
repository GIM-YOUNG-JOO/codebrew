package com.mycompany.codebrew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.service.ProductRegistrationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ProductRegistrationService service;
	
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
	
	@PostMapping("/registComplete")
	public String registComplete(Product product) {

		log.info("prid : " + product.getPrid());
		log.info(product.getPrname());
		log.info("pcid : " + product.getPcid());
		log.info("price : " + product.getPrprice());
		service.registComplete(product);
		return "redirect:/";
	}
	
	@RequestMapping("/productDelete")
	public String productDelete() {
		log.info("상품 삭제 실행");
		return "admin/productDelete";
	}
}
