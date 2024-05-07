package com.mycompany.codebrew.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.ProductDetail;
import com.mycompany.codebrew.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/menu")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("")
	public String menuIndex() {
		log.info("실행");
		return "order/menu";
	}
	
	@RequestMapping("/cart")
	public String cart() {
		log.info("실행");
		return "order/cart";
	}
	@GetMapping("/detailPage")
	public String detailPageGet() {
		log.info("실행");
		return "order/detailPage";
	}
	@PostMapping("/detailPage")
	public String detailPagePost(ProductDetail productDetail) {
		log.info("실행");
		log.info("productDetail" + productDetail);
		//상품아이디와 원두옵션, 온도옵션, 사이즈옵션, 샷 수량을 받아서  카트테이블로 넘겨주기
		service.registProductDetail(productDetail);
		return "order/detailPage";
	}
}
