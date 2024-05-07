package com.mycompany.codebrew.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.JoinNowValidator;
import com.mycompany.codebrew.service.JoinNowService;

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
	
	/*@PostMapping("/signUp")
	public String signUp(Account account) {
		log.info("회원등록 실행");
		log.info(account.getAcName());
		log.info("" + account.getAcId());
		log.info(account.getAcPassword());
		log.info(account.getAcTel());
		log.info(account.getAcEmail());
		jnservice.joinNow(account);
		return "redirect:/";
	}*/
	
	@InitBinder("account") //Account dto 객체 관련 유효성 검사는 joinNowValidator 객체로 진행
	public void joinNowValidator(WebDataBinder binder) {
		binder.setValidator(new JoinNowValidator());
		log.info("joinNowValidator()실행");
	}
	
	@RequestMapping ("/signUp")
	public String signUp(@Valid Account account, Errors errors) {
		log.info("회원등록 실행");
		log.info(account.getAcName());
		log.info("" + account.getAcId());
		log.info(account.getAcPassword());
		log.info(account.getAcTel());
		log.info(account.getAcEmail());
		jnservice.joinNow(account);
		//유효성 검사 실패시 다시 회원가입 폼 보여주기
		if(errors.hasErrors()) {  //유효성 검사 진행 시 에러가 존재할 경우 error에 저장하고 joinNow.jsp로 이동
			return "signJoin/joinNow";
		}
		//회원가입 처리
		return "redirect:/"; 
	}
}
