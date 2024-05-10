package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@GetMapping("/myInfo")
	public String myInfo() {
		log.info("마이페이지 내 정보 실행");
		return "mypage/myInfo";
	}
	
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
		int rowsPagingTarget = boardService.getTotalRow();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		List<Board> boardList;
		
	    // 제목 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			boardList = boardService.getLike(pager);
		} else {
			// 제목 있을 경우 실행되는 정렬
			pager.setSearchText(searchText);
			boardList = boardService.getLikeByTitle(pager);
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
			int rowsPagingTarget = boardService.getTotalRow();
			Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			
			List<Board> boardList;
			
		    // 제목 없을 경우 실행되는 정렬
			if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
				boardList = boardService.getLike(pager);
			} else {
				// 제목 있을 경우 실행되는 정렬
				pager.setSearchText(searchText);
				boardList = boardService.getLikeByTitle(pager);
			}
			model.addAttribute("boardList", boardList);
			model.addAttribute("pager", pager);
			
			return "board/myWriteBoardHistory";
		}
		
	
}
