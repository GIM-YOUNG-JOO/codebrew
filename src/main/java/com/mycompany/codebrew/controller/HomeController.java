package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@GetMapping("/")
	public String index() {
		log.info("실행");
		return "home";
	}
	
	@GetMapping("/error403")
	public String error403() {
		log.info("권한 없음 실행");
		return "common/error403";
	}
	
}
