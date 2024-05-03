package com.mycompany.codebrew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.service.JoinNowService;
import com.mycompany.codebrew.service.ProductRegistrationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/signJoin")
public class AccountController {
	@Autowired
	private JoinNowService jnservice;
	
	
	@GetMapping("/signIn")
	public String signIn() {
		log.info("실행");
		return "signJoin/signIn";
	}
	
	@GetMapping("/joinNow")
	public String joinNow() {
		log.info("회원가입 JSP 실행");
		return "signJoin/joinNow";
	}
	
	@PostMapping("/signUp")
	public String signUp(Account account) {
		log.info("회원등록 실행");
		log.info(account.getAcName());
		log.info("" + account.getAcId());
		log.info(account.getAcPassword());
		log.info(account.getAcTel());
		log.info(account.getAcEmail());
		jnservice.joinNow(account);
		return "redirect:/";
	}
}
