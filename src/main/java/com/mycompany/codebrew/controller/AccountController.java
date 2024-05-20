package com.mycompany.codebrew.controller;

import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 로그인 페이지 이동
	@GetMapping("/signIn")
	public String signIn() {
		log.info("AccountController - signIn실행");
		return "signJoin/signIn";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/joinNow")
	public String joinNow() {
		log.info("AccountController - joinNow실행");
		return "signJoin/joinNow";
	}
	
	// 회원가입 유효성 검사
	@InitBinder("account") //Account dto 객체 관련 유효성 검사는 joinNowValidator 객체로 진행
	public void joinNowValidator(WebDataBinder binder) {
		binder.setValidator(new JoinNowValidator());	
	}
	
	// 회원가입 진행
	@RequestMapping ("/signUp")
	public String signUp(@Valid Account account, Errors errors) {
		log.info("AccountController - signUp실행");
		//유효성 검사 실패시 다시 회원가입 폼 보여주기
		if(errors.hasErrors()) {  //유효성 검사 진행 시 에러가 존재할 경우 error에 저장하고 joinNow.jsp로 이동
			return "signJoin/joinNow";
		}
		// 회원 정보 등록
		jnservice.joinNow(account);
		// 회원 가입 후 홈으로 돌아가기
		return "redirect:/"; 
	}
	
	// 아이디 찾기 페이지 이동
	@GetMapping("/findId")
	public String findId() {
		log.info("AccountController - findId실행");
		return "signJoin/findId";	
	}
	
	//이름, 전화번호로 아이디 찾기 진행
    @PostMapping("/findIdByTel")
    public ResponseEntity<Object> findId(@RequestParam("acName") String acName, @RequestParam("acTel") String acTel) {
    	log.info("AccountController - findIdByTel실행");
        String acId = acservice.findAccountIdByTel(acName, acTel);
        log.info("찾은 acId : " + acId);
        if (acId != null) {
            // 만약 아이디가 존재하면 JSON 형식으로 아이디를 리턴
            return new ResponseEntity<>(acId, HttpStatus.OK);
        } else {
            // 아이디가 없는 경우 오류 메시지를 리턴
            String errorMessage = " 정보가 없습니다.";
            return new ResponseEntity<>(errorMessage, HttpStatus.NOT_FOUND);
        }
    }
	
    // 이경환
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/changePassword")
	public String changePassword() {
		log.info("AccountController - changePassword실행");
		return "signJoin/changePassword";	
	}
	
	@ResponseBody
	@PostMapping("/findPassword")
	public Map<String ,Integer> findPassword(Account account) {
		log.info("AccountController - findPassword실행");
		Map<String,Integer> map = new HashMap<>();
		Account accountSaved = acservice.findAccountPwByIdAndTelAndEmail(account);
		if(accountSaved == null) {
			map.put("result", 0);
		} else {
			map.put("result", 1);
		}
		return map;
		}
	
	// 이경환
	// 업데이트 시 post로 값을 넘기는 컨트롤러
	@PostMapping("/updatePassword")
	public String updatePassword(Account account) {
		log.info("AccountController - updatePassword실행");
		acservice.updatePassword(account);
		return "redirect:/signJoin/signIn";
	}
}