package com.mycompany.codebrew.controller;





import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.security.CodebrewUserDetails;
import com.mycompany.codebrew.service.AccountService;
import com.mycompany.codebrew.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	
	//MyPageService myPageService; 로 주입할 수 있도록 service단 수정해야함
	@Autowired //myInfo 주입용
	private AccountService acservice;

	@GetMapping("/myInfo")
	public String myInfoDetail(Authentication authentication, Model model) {
		log.info("실행");
    
		//사용자 정보 얻기
		CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetails.getAccount();
		model.addAttribute("account", account);
		return "mypage/myInfo";
	}
	
	@PostMapping("/myInfoChange")
	public String myInfoChange(@RequestBody Map<String, String> accountChange, Authentication authentication, Model model) {
		log.info("첫번째 값" + accountChange);
	    // input으로 들어온 값을 변수에 저장
		String acName = accountChange.get("acNameN");
	    String acEmail = accountChange.get("acEmailE");
	    String acTel = accountChange.get("acTelT");
	    String acPassword = accountChange.get("acPasswordP");
	    String acPasswordCheck = accountChange.get("acPasswordPP");
	    CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
	    
	    //받아온 값으로 계정의 정보를 업데이트 해주는 코드(전달)
	    Account account = new Account();
	    account.setAcId(codebrewUserDetails.getAcId());
	    account.setAcName(acName);
	    account.setAcEmail(acEmail);
	    account.setAcTel(acTel);
	    account.setAcPassword(acPassword);
	    account.setAcPasswordCheck(acPasswordCheck);
	    account.setAcRole(codebrewUserDetails.getAcRole());
	    log.info("account" + account);
	    
	    myPageService.ChangeAccount(account);
	    log.info("계정정보 업데이트 실행");
		
		// ----------------------------------------
		// 업데이트한 계정의 정보를 불러오는 코드(받아오기)
	    String acId = codebrewUserDetails.getAcId();
	    Account accountChanged = myPageService.getAccount(acId);
	    log.info("accountChanged" + accountChanged);
		// 업데이트 된 계정의 정보를 모델을 통해 저장해주는 코드
		model.addAttribute("accountChanged", accountChanged);
		// 업데이트 된 정보를 에이젝스로 보여줌
		return "mypage/myInfoAjax";
	}
	

	
	// 좋아요 정렬 및 제목 정렬
	@GetMapping(value ="/myWriteBoardHistory", produces = "application/json; charset=UTF-8")
	public String myWriteBoardHistory(String pageNo, Model model, HttpSession session, Principal principal) {
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		
		// 문자열로 받은 pageNo를 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		int rowsPagingTarget = myPageService.getBoardTotalRow(principal.getName());
		log.info("" + rowsPagingTarget);
		Pager pager = new Pager(3, 3, rowsPagingTarget, intPageNo);
		
		// springSecurity에서 acId값 받아서 pager에 넣어줌 xml에서 사용 위해서(나중에 map으로 변경예정)
		pager.setAcId(principal.getName());
		List<Board> boardList = myPageService.getMyBoard(pager);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		log.info("" + boardList);
		log.info("" + pageNo);
		
		return "mypage/myWriteBoardHistory";
	}
		
	
}
