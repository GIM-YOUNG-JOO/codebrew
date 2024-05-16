package com.mycompany.codebrew.controller;





import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	@Autowired //myInfo 주입용
	private AccountService acservice;

	@Secured("ROLE_USER")
	@GetMapping("/myInfo")
	public String myInfoDetail(Authentication authentication, Model model) {
		log.info("실행");
    
		//사용자 정보 얻기
		CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetails.getAccount();
		model.addAttribute("account", account);
		return "mypage/myInfo";
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
		int rowsPagingTarget = myPageService.getTotalRow(principal.getName());
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
