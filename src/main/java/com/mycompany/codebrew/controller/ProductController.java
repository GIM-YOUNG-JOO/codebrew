package com.mycompany.codebrew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.codebrew.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/menu")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("")
	public String menuIndex() {
		log.info("실행");
		return "order/menu";
	}
}
