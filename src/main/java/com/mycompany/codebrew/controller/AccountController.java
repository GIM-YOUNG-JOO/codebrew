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
	
	@InitBinder("account") //@InitBinder 초기에 엮어주는 어노테이션  ch04LoginForm 관련 객체에 대한 유효성 검사는 (new Ch04LoginFormValidator)객체로 진행해라
	public void joinNowValidator(WebDataBinder binder) {
		binder.setValidator(new JoinNowValidator());
		log.info("joinNowValidator()실행");
	}
	
	@RequestMapping ("/signUp")
	public String signUp(@Valid Account account, Errors errors) { // Ch04LoginForm 가 써포트에  있는 class와 같아야함
		log.info("회원등록 실행");
		log.info(account.getAcName());
		log.info("" + account.getAcId());
		log.info(account.getAcPassword());
		log.info(account.getAcTel());
		log.info(account.getAcEmail());
		jnservice.joinNow(account);
		//유효성 검사 실패시 다시 회원가입 폼 보여주기
		if(errors.hasErrors()) {  //유효성 검사를 진행했더니 에러를 has하고 있어서 true가 리턴될 경우 error에 저장하고 form.jsp로 이동
			return "signJoin/joinNow";
		}
		//회원가입 처리
		return "redirect:/"; 
	}
}
