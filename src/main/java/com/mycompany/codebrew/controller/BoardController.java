package com.mycompany.codebrew.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		log.info( "전체 갯수: " + rowsPagingTarget);
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		//		     페이지당 행수, 한번에 보이는 페이징 수, 전체 행수, 원하는 페이지 넘버
		
		// 페이징 처리
		List<Board> boardList = boardService.getBoardList(pager);
		
		
		
		// JSP에서 사용하려면 값을 넘겨줘야함
		model.addAttribute("pager", pager);
		model.addAttribute("boardList", boardList);
		
		
		log.info("실행");
		return "board/boardList";
	}

	@GetMapping("/boardDetail")
	public String boardDetail(int boId, Model model) {
		Board board = boardService.getBoard(boId);
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
		
		// 이후에 공지사항인지, 리뷰인지 확인해서 받아 와야함 -> 현재 리뷰로 고정
		board.setBcId(2);
		
		board.setBoCommentCount(0);
		
		boardService.writeBoard(board);

		return "redirect:/board/boardList";
	}
	
	// AJAX - 최신순으로 게시판 Body 수정하는 컨트롤
	@PostMapping(value ="/sortByDate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sortByDate(@RequestBody Map<String, Object> sendJson) {
		JSONArray jsonArray = new JSONArray();
		List<Board> dateList;
		
		// 제목에 있는 타이틀을 받아옴
		String searchText = (String) sendJson.get("searchInput");
		System.out.println("searchText: " + searchText);
		
		// Pager 내용 받아옴
	    Map<String, Object> pager = (Map<String, Object>) sendJson.get("pager");
	    int startPageNo = (int) pager.get("startPageNo");
	    int endPageNo = (int) pager.get("endPageNo");
	    int pageNo = (int) pager.get("pageNo");
	    int totalPageNo = (int) pager.get("totalPageNo");
	    
	    System.out.println("startPageNo: " +startPageNo);
	    System.out.println("endPageNo: " +endPageNo);
	    System.out.println("pageNo: " +pageNo);
	    System.out.println("totalPageNo: " +totalPageNo);
	    
	    // 제목 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			dateList = boardService.getDate();
		// 제목 있을 경우 실행되는 정렬
		} else {
			dateList = boardService.getDateByTitle(searchText);
		}
		
		// Board의 내용 필드에 저장
		for(Board board : dateList) {
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
		
		JSONObject jsonObject1 = new JSONObject();
		jsonObject1.put("startPageNo", startPageNo);
		jsonObject1.put("endPageNo", endPageNo);
		jsonObject1.put("pageNo", pageNo);
		jsonObject1.put("totalPageNo", totalPageNo);
		
//		jsonArray.put(jsonObject1);
		
		JSONObject result = new JSONObject();
	    result.put("boards", jsonArray); // 게시물 데이터를 "boards"라는 키로 설정
	    result.put("pager", jsonObject1); // 페이저 데이터를 "pager"라는 키로 설정
	    
		return result.toString();
	}
	
//	// AJAX - 최신순으로 게시판 Body 수정하는 컨트롤
//	@PostMapping(value ="/sortByDate", produces = "application/json; charset=UTF-8")
//	@ResponseBody
//	public String sortByDate(@RequestParam("searchText") String searchText) {
//		JSONArray jsonArray = new JSONArray();
//		List<Board> dateList;
//		
//		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
//			dateList = boardService.getDate();
//		} else {
//			dateList = boardService.getDateByTitle(searchText);
//		}
//		
//		for(Board board : dateList) {
//			JSONObject jsonObject = new JSONObject();
//			jsonObject.put("boId", board.getBoId());
//			jsonObject.put("acId", board.getAcId());
//			jsonObject.put("boTitle", board.getBoTitle());
//			jsonObject.put("boContent", board.getBoContent());
//			jsonObject.put("boDate", board.getBoDate());
//			jsonObject.put("boNewdate", board.getBoNewdate());
//			jsonObject.put("boHitcount", board.getBoHitcount());
//			jsonObject.put("bcId", board.getBcId());
//			jsonObject.put("boLike", board.getBoLike());
//			jsonObject.put("boCommentCount", board.getBoCommentCount());
//			
//			jsonArray.put(jsonObject);
//		}
//		return jsonArray.toString();
//	}
	
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
	
	//TODO: 댓글로 정렬하는 로직
	//
	
	
	// 제목으로 검색하는 로직
	@GetMapping(value ="/searchTitle", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String searchTitle(@RequestParam("searchText") String searchText) {
		
		JSONArray jsonArray = new JSONArray();
		List<Board> sortedDataList = boardService.getSearchTitle(searchText);
		
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
	
	
	
	
	

	
}
