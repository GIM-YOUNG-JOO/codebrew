package com.mycompany.codebrew.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/menu")
public class ProductController {
	
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
	@RequestMapping("/detailPage")
	public String detailPage() {
		log.info("실행");
		return "order/detailPage";
	}
}
