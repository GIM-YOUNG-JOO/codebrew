package com.mycompany.codebrew.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.JoinNowValidator;
import com.mycompany.codebrew.service.AccountService;
import com.mycompany.codebrew.service.JoinNowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/signJoin")
public class AccountController {
	@Autowired
	private JoinNowService jnservice;
	
	@Autowired
	private AccountService acservice;
	
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
	
	//아이디 찾기 페이지 이동
	@GetMapping("/findId")
	public String findId() {
		log.info("아이디찾기페이지실행");
		return "signJoin/findId";	
	}
	

	
	//이름, 전화번호로 아이디 찾기
    @PostMapping("/findIdByTel")
    public ResponseEntity<Object> findId(@RequestParam("acName") String acName, @RequestParam("acTel") String acTel) {
        String acId = acservice.findAccountIdByTel(acName, acTel);
        if (acId != null) {
            // 만약 아이디가 존재하면 JSON 형식으로 아이디를 리턴
            return new ResponseEntity<>(acId, HttpStatus.OK);
        } else {
            // 아이디가 없는 경우 오류 메시지를 리턴
            String errorMessage = " 정보가 없습니다.";
            return new ResponseEntity<>(errorMessage, HttpStatus.NOT_FOUND);
        }
    }
	
	//비밀번호 찾기 페이지 이동
	@GetMapping("/changePassword")
	public String changePassword() {
		log.info("비밀번호수정실행");
		return "signJoin/changePassword";	
	}
}
