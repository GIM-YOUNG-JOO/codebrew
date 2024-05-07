package com.mycompany.codebrew.controller;

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
		
		// 문자열로 받은 pageNo를 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// Pager 객체 생성
		int rowsPagingTarget = boardService.getTotlaRow();
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
	public String boardRegisterPost(Board board) {
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

		// 로그인된 사용자 아이디 설정
		// grade로 나중에 변경해야함 -> user or admin
		board.setAcId("test");
		// 이후에 공지사항인지, 리뷰인지 확인해서 받아 와야함
		board.setBcId(1);

		boardService.writeBoard(board);

		return "redirect:/board/boardList";
	}
	
	// Ajax를 위한 컨트롤러
	@GetMapping(value ="/sortByDate", produces = "application/json; charset=UTF-8")
	public String sortByDate(Model model) {
		log.info("sortByDate 실행1");
		JSONArray jsonArray = new JSONArray();
		List<Board> dateList = boardService.getDate();
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
			jsonObject.put("boAttachdata", board.getBoAttachdata());
			jsonObject.put("boLike", board.getBoLike());
			
			jsonArray.put(jsonObject);
		}
		log.info("sortByDate 실행2");
		return jsonArray.toString();
	}
	
	

	
}
