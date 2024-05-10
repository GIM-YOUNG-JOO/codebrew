package com.mycompany.codebrew.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

//	@Autowired
//	AccountService accountSerivce;

	@RequestMapping("/boardList")
	public String boardList(String pageNo, Model model, HttpSession session) {
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		
		System.out.println("pageNo:" + pageNo);
		// 문자열로 받은 pageNo를 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// Pager 객체 생성
		int rowsPagingTarget = boardService.getTotalRow();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		//		     페이지당 행수, 한번에 보이는 페이징 수, 전체 행수, 원하는 페이지 넘버
		// 페이징 처리
		List<Board> boardList = boardService.getBoardList(pager);
		
		// JSP에서 사용하려면 값을 넘겨줘야함
		model.addAttribute("pager", pager);
		model.addAttribute("boardList", boardList);
		
		
		
		return "board/boardList";
	}

	@RequestMapping("/boardDetail")
	public String boardDetail() {
		log.info("실행");
		return "board/boardDetail";
	}

	@GetMapping("/boardRegister")
	public String boardRegisterGet() {
		log.info("실행");
		return "board/boardRegister";
	}

	@PostMapping("/boardRegister")
	public String boardRegisterPost(Principal principal, Board board) {
		// 요청 데이터의 유효성 검사
		log.info("original filename: " + board.getBoAttach().getOriginalFilename());
		log.info("filetype: " + board.getBoAttach().getContentType());
		log.info("acid: " + principal.getName());
		if (board.getBoAttach() != null & !board.getBoAttach().isEmpty()) {
			// DTO 추가 설정 -> 이후에 이름, 타입 필요하면 추가 예정
//					board.setBattachoname(board.getBattach().getOriginalFilename());
//					board.setBattachtype(board.getBattach().getContentType());

			try {
				board.setBoAttachdata(board.getBoAttach().getBytes());
				// multipartFile에서 바이트 -> 파일 정보 받아옴
			} catch (Exception e) {

			}
		}
		
		// 로그인된 사용자 아이디 설정 - 로그인해야만 넣을 수 있음
		// Security 사용시 principal에서 로그인된 id값 받아 올 수 있음
		// 로그인 안하면 에러남
		board.setAcId(principal.getName());
		log.info("acid: " + principal.getName());
		// 1번 공지사항, 2번 리뷰
		// 이후에 공지사항인지, 리뷰인지 확인해서 받아 와야함 -> 현재 리뷰로 고정
		board.setBcId(2);
		board.setBoCommentCount(0);
		boardService.writeBoard(board);

		return "redirect:/board/boardList";
	}
	
	// AJAX - 최신순으로 게시판 Body 수정하는 컨트롤
	@GetMapping(value ="/sortByDate", produces = "application/json; charset=UTF-8")
	public String sortByDate(String pageNo, String searchText, Model model, HttpSession session) {
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
			boardList = boardService.getDate(pager);
		} else {
			// 제목 있을 경우 실행되는 정렬
			pager.setSearchText(searchText);
			boardList = boardService.getDateByTitle(pager);
			
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		
		return "board/boardListAjaxByDate";
	}
	
	@GetMapping(value ="/sortByHitcount", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sortByHitcount(@RequestParam("searchText") String searchText) {
		
		JSONArray jsonArray = new JSONArray();
		List<Board> sortedDataList;
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			sortedDataList = boardService.getHitcount();
		} else {
			sortedDataList = boardService.getHitcountByTitle(searchText);
		}
		 
		for(Board board : sortedDataList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("boId", board.getBoId());
			jsonObject.put("acId", board.getAcId());
			jsonObject.put("boTitle", board.getBoTitle());
			jsonObject.put("boContent", board.getBoContent());
			jsonObject.put("boDate", board.getBoDate());
			jsonObject.put("boNewdate", board.getBoNewdate());
			jsonObject.put("boHitcount", board.getBoHitcount());
			jsonObject.put("bcId", board.getBcId());
			jsonObject.put("boLike", board.getBoLike());
			jsonObject.put("boCommentCount", board.getBoCommentCount());
			
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
	@GetMapping(value ="/sortByLike", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sortByLike(@RequestParam("searchText") String searchText) {
		List<Board> sortedDataList;
		JSONArray jsonArray = new JSONArray();
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			sortedDataList = boardService.getLike();
		} else {
			sortedDataList = boardService.getLikeByTitle(searchText);
		}
		
		for(Board board : sortedDataList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("boId", board.getBoId());
			jsonObject.put("acId", board.getAcId());
			jsonObject.put("boTitle", board.getBoTitle());
			jsonObject.put("boContent", board.getBoContent());
			jsonObject.put("boDate", board.getBoDate());
			jsonObject.put("boNewdate", board.getBoNewdate());
			jsonObject.put("boHitcount", board.getBoHitcount());
			jsonObject.put("bcId", board.getBcId());
			jsonObject.put("boLike", board.getBoLike());
			jsonObject.put("boCommentCount", board.getBoCommentCount());
			
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
	// TODO: 댓글로 정렬하는 로직
	
	
	// TODO: 2페이지에서 검색시 자동으로 1페이지로 이동하는거 구현해야함
	@GetMapping(value ="/searchTitle", produces = "application/json; charset=UTF-8")
	public String searchTitle(String pageNo, String searchText, Model model, HttpSession session) {
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
		pager.setSearchText(searchText);
		boardList = boardService.getSearchTitle(pager);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		
		return "board/boardListAjaxByTitle";
	}
	
	
	

	
}
