package com.mycompany.codebrew.controller;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.service.AccountService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired //myInfo 주입용
	private AccountService acservice;
	
/*	@GetMapping("/myInfo")
	public String myInfoDetail(Authentication authentication, Model model) {
		log.info("마이페이지 내 정보 실행");
		String acId = authentication.getName();
		Account account = acservice.getAccount(acId);
		model.addAttribute("account", account);
		return "mypage/myInfo";
	}*/
	
/*	@GetMapping("/myInfo")
	public String myInfoDetail(Authentication authentication) {
		log.info("실행");
		//사용자 아이디 얻기
		String acId = authentication.getName();
		      
		//사용자 아이디 및 이메일 얻기
		CodebrewUserDtails codebrewUserDtails = (CodebrewUserDtails) authentication.getPrincipal();
		Account account = codebrewUserDtailsO
		String mname = member.getMname();
		String memail = member.getMemail();
	}*/
}
