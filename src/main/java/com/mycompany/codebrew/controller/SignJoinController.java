package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/signJoin")
public class SignJoinController {
	@RequestMapping("/signIn")
	public String signIn() {
		log.info("실행");
		return "signJoin/signIn";
	}
	
	@RequestMapping("/joinNow")
	public String joinNow() {
		log.info("실행");
		return "signJoin/joinNow";
	}
}
