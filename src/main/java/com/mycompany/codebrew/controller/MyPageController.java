package com.mycompany.codebrew.controller;





import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;
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
	
	@GetMapping(value ="/sortByLike", produces = "application/json; charset=UTF-8")
	public String sortByLike(String pageNo, String searchText, Model model, HttpSession session) {
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
		int rowsPagingTarget = myPageService.getTotalRow();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		List<Board> boardList;
		
	    // 제목 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			boardList = myPageService.getLike(pager);
		} else {
			// 제목 있을 경우 실행되는 정렬
			pager.setSearchText(searchText);
			boardList = myPageService.getLikeByTitle(pager);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		
		return "board/boardListAjaxByLike";
	}
	
	// 좋아요 정렬 및 제목 정렬
		@GetMapping(value ="/myWriteBoardHistory", produces = "application/json; charset=UTF-8")
		public String myWriteBoardHistory(String pageNo, String searchText, Model model, HttpSession session) {
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
			int rowsPagingTarget = myPageService.getTotalRow();
			Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			
			List<Board> boardList;
			
		    // 제목 없을 경우 실행되는 정렬
			if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
				boardList = myPageService.getLike(pager);
			} else {
				// 제목 있을 경우 실행되는 정렬
				pager.setSearchText(searchText);
				boardList = myPageService.getLikeByTitle(pager);
			}
			model.addAttribute("boardList", boardList);
			model.addAttribute("pager", pager);
			
			return "board/myWriteBoardHistory";
		}
		
	
}
