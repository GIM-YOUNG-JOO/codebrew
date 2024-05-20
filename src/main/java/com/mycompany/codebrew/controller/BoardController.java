package com.mycompany.codebrew.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.codebrew.dto.BoLike;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.BocLike;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.security.CodebrewUserDetails;
import com.mycompany.codebrew.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 이경환
	// 게시판 jsp를 부르는 컨트롤러
	@RequestMapping("/boardList")
	public String boardList(String pageNo, Model model, HttpSession session) {
		log.info("BoardController - boardList실행");
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
		
		// 전체 열의 수를 서버에서 받아옴
		int rowsPagingTarget = boardService.getTotalRow();
		
		// Pager 객체 생성
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		// 페이지당 행수, 한번에 보이는 페이징 수, 전체 행수, 원하는 페이지 넘버
		// 페이징 처리
		
		// 게시판의 내용을 리스트로 받아와서 뿌려주기 위해서 서버에서 찾아옴
		List<Board> boardList = boardService.getBoardList(pager);
		
		// JSP에서 사용하려면 값을 넘겨줘야함
		model.addAttribute("pager", pager);
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	}
	
	//정태환
	@Secured("ROLE_USER")
	@GetMapping("/boardDetail")
	public String boardDetail(int boId, Model model, Authentication authentication) {
		log.info("BoardController - boardDetail실행");
		//게시글 작성자와 로그인한 유저의 일치여부 확인을 위한 코드
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String user = codebrewUserDetail.getAccount().getAcId();
		model.addAttribute("user", user);
		//boId를 통해 게시물 상세내용 가져와주는 코드
		Board board = boardService.getBoard(boId);
		//board데이터에 이미지를 바이트 타입으로 불러오고 데이터가 있다면 스트링타입으로 변환해서 board에 저장해준다.
		byte[] imageData = board.getBoAttachdata();
		if (imageData != null) {
			String img = Base64.getEncoder().encodeToString(imageData);
			board.setBoImageOut(img);
		}
		//board와 관련된 comment 모두 찾아와서 list로 넘겨주기
		List<BoardComment> commentList = boardService.getCommentList(boId);
		//상세내용을 jsp에 넘겨주는 코드
		model.addAttribute("board", board);
		model.addAttribute("boardCommentList", commentList);
		return "board/boardDetail";
	}
	
	//정태환
	@PostMapping("/boardCommentAjax")
	public String boardCommentRegister(Authentication authentication, @RequestBody BoardComment formData, Model model) {
		log.info("BoardController - boardCommentAjax실행");
		//댓글 작성자와 로그인한 유저의 일치여부 확인을 위한 코드
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String user = codebrewUserDetail.getAccount().getAcId();
		formData.setAcId(user);
		//받아왔으니 insert를 통해 등록해주는 코드
		boardService.writeBoardComment(formData);
		//등록해줬으니 commentList를 다시 불러와서 model을 통해 다시 저장해주는 코드
		List<BoardComment> commentList = boardService.getCommentList(formData.getBoId());
		model.addAttribute("boardCommentList", commentList);
		model.addAttribute("user", user);
		return "board/boardDetailAjax";
	}
	
	//정태환
	@PostMapping("/boardCommentDelete")
	public String boardCommentDelete(Authentication authentication, @RequestBody BoardComment boardComment, Model model) {
		log.info("BoardController - boardCommentDelete실행");
		//댓글 작성자와 로그인한 유저의 일치여부 확인을 위한 코드
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String user = codebrewUserDetail.getAccount().getAcId();
		//받아온 댓글을 지워주는 코드
		boardService.deleteComment(boardComment.getBocId(),boardComment.getBoId());
		List<BoardComment> commentList = boardService.getCommentList(boardComment.getBoId());
		model.addAttribute("boardCommentList", commentList);
		model.addAttribute("user", user);
		return "board/boardDetailAjax";
	}
	
	//정태환
	@PostMapping("/boardDelete")
	public String boardDelete(Board board) {
		log.info("BoardController - boardDelete실행");
		//받아온 정보를 이용해 게시글을 삭제해주는 코드
		boardService.boardDelete(board.getBoId());
		return "redirect:/board/boardList";
	}
	
	//정태환
	@ResponseBody
	@PostMapping("/boardLike")
	public Map<String, Integer> boardLike(Authentication authentication,@RequestBody BoLike boLike) {
		log.info("BoardController - boardLike실행");
		//어떤 유저가 좋아요를 했는지 확인하기 위한 코드
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String acId = codebrewUserDetail.getAccount().getAcId();
		boLike.setAcId(acId);
		//유저의 좋아요 여부를 확인하고 좋아요를 한 적 없으면 좋아요 해주고 이미 좋아요 했다면 할 수 없다고 알려주자.
		//좋아요 테이블을 불러와주자
		BoLike boLikeDb = boardService.getBoardLike(boLike);
		int state = boLikeDb.getBolState(); //좋아요 기본값 0
		int result = 0;
		if(boLike.getBolState() != state && boLike.getBolState() == 1) {
			//boLiKe의 상태를  1로 바꿔주고 board의 추천을 1 증가시켜주는 코드
			if(boLikeDb.getBolState() != -1) {
				//직전의 추천상태가 -1이 아니였다면 1증가
				boardService.getIncreaseLike(boLike);
			}else if(boLikeDb.getBolState() == -1) {
				//직전의 추천상태가 1이 였다면 2증가
				boardService.getDoubleIncreaseLike(boLike);
			}
			//스크립트 화면에 보내줄 결과 값 1
			result = 1;
		}else if(boLike.getBolState() != state && boLike.getBolState() == -1) {
			//boLike의 상태를 -1로 바꿔주고 board의 좋아요를  1 감소시켜주는 코드
			if(boLikeDb.getBolState() != 1) {
				//직전의 추천상태가 1이 아니였다면 1감소
				boardService.getDecreaseLike(boLike);
			}else if(boLikeDb.getBolState() == 1) {
				//직전의 추천상태가 1이 였다면 2감소
				boardService.getDoubleDecreaseLike(boLike);
			}
			//스크립트에 보내줄 결과 값 2
			result = 2;
		}else if(boLike.getBolState() == state && boLike.getBolState() == 1) {
			//DB에 저장되어있는 추천상태와 DB의 추천상태가 같고 받아온 데이터의 상태가 추천이라면 추천을 취소해주는 코드
			boardService.restoreBoardLike(boLike);
			//스크립트에 보내줄 결과 값 3
			result = 3;
		}else if(boLike.getBolState() == state && boLike.getBolState() == -1) {
			//DB에 저장되어있는 추천상태와 DB의 추천상태가 같고 받아온 데이터의 상태가 비추천이라면 비추천을 취소해주는 코드
			boardService.restoreBoardLike(boLike);
			result = 4;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("Num", result);
		return map;
	}
	
	//정태환
	@ResponseBody
	@PostMapping("/boardCommentLike")
	public Map<String, Integer> boardCommentLike(Authentication authentication,@RequestBody BocLike bocLike) {
		log.info("BoardController - boardCommentLike실행");
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String acId = codebrewUserDetail.getAccount().getAcId();
		bocLike.setAcId(acId);
		//좋아요 여부를 확인하고 좋아요를 한 적 없으면 좋아요 해주고 이미 좋아요 했다면 할 수 없다고 알려주자.
		//좋아요 테이블을 불러와주자
		BocLike bocLikeDb = boardService.getBoardCommentLike(bocLike);
		int state = bocLikeDb.getBoclState();
		int result = 0;
		if(bocLike.getBoclState() != state && bocLike.getBoclState() == 1) {
			//boLiKe의 상태를  1로 바꿔주고 board의 좋아요를 1 증가시켜주자
			if(bocLikeDb.getBoclState() != -1) {
				boardService.getIncreaseCommentLike(bocLike);
			}else if(bocLikeDb.getBoclState() == -1) {
				boardService.getDoubleIncreaseCommnetLike(bocLike);
			}
			result = 1;
		}else if(bocLike.getBoclState() != state && bocLike.getBoclState() == -1) {
			//boLike의 상태를 -1로 바꿔주고 board의 좋아요를  1 감소시켜주자
			if(bocLikeDb.getBoclState() != 1) {
				boardService.getDecreaseCommentLike(bocLike);
			}else if(bocLikeDb.getBoclState() == 1) {
				boardService.getDoubleDecreaseCommentLike(bocLike);
			}
			result = 2;
		}else if(bocLike.getBoclState() == state && bocLike.getBoclState() == 1) {
			//좋아요를 취소해주자 bolState를 0으로 업데이
			boardService.restoreBoardCommentLike(bocLike);
			result = 3;
		}else if(bocLike.getBoclState() == state && bocLike.getBoclState() == -1) {
			//싫어요를 취소해주자 bolaState를 0으로 업데이트
			boardService.restoreBoardCommentLike(bocLike);
			result = 4;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("Num", result);
		return map;
	}
	
	// 이경환
	// 게시판 등록 페이지 jsp 호출 컨트롤러
	@Secured("ROLE_USER")
	@GetMapping("/boardRegister")
	public String boardRegisterGet(Model model, Authentication authentication) {
		log.info("BoardController - boardRegister(Get)실행");
		
		// 게시판 작성시 자신의 번호를 서버에 저장해야 해서 acId 받아옴
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String acId = codebrewUserDetail.getAccount().getAcId();
		
		// 찾아온 값의 권한(role)을 확인하기 위해서 account를 서버에서 찾아서 넘겨야함
		Account account = boardService.getAccountRole(acId);
		model.addAttribute("account", account);
		return "board/boardRegister";
	}
	
	// 이경환
	// 게시판 등록 값 전달 post 컨트롤러
	@PostMapping("/boardRegister")
	public String boardRegisterPost(Authentication authentication, Board board, @RequestParam ("category") int category) {
		log.info("BoardController - boardRegistre(Post)실행");
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		String acId = codebrewUserDetail.getAccount().getAcId();
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
	
		// 로그인을해야 authentication에서 값을 받아 올 수 있음
		board.setAcId(acId);
		// 카테고리 값 (공지사항 = 1, 리뷰 = 2) 받아와서 넣어줌
		board.setBcId(category);
		// 최초 댓글 0으로 초기화
		board.setBoCommentCount(0);
		// 최초 좋아요 0으로 초기화
		board.setBoLike(0);
		// 게시판 작성하여 DB에 저장
		boardService.writeBoard(board);
		return "redirect:/board/boardList";
	}
	
	// 이경환
	// 날짜별 정렬 및 제목 정렬 - AJAX 컨트롤러
	@GetMapping(value ="/sortByDate", produces = "application/json; charset=UTF-8")
	public String sortByDate(String pageNo, String searchText, Model model, HttpSession session) {
		log.info("BoardController - sortByDate실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		// 문자열로 받은 pageNo를 정수로 변환
		Pager pager;
		List<Board> boardList;
	    // 검색 내용이 없을 경우 실행되는 날짜별 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			int intPageNo = Integer.parseInt(pageNo);
			// 서버의 전체 열의 수를 받아옴
			int rowsPagingTarget = boardService.getTotalRow();
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			// 최신 순으로 게시글을 받아옴
			boardList = boardService.getDate(pager);
		} else {
			// 검색 내용이 있을 경우 실행되는 날짜별 정렬
			int intPageNo = Integer.parseInt(pageNo);
			// 서버에서 검색 내용의 열의 수를 받아옴
			int rowsPagingTarget = boardService.getRowBySearchText(searchText);
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			pager.setSearchText(searchText);
			// 검색 내용에 맞는 게시글을 찾아와서 최신 순으로 정렬
			boardList = boardService.getDateByTitle(pager);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "board/boardListAjaxByDate";
	}
	
	// 이경환
	// 조회수 정렬 및 제목 정렬 - AJAX 컨트롤러
	@GetMapping(value ="/sortByHitcount", produces = "application/json; charset=UTF-8")
	public String sortByHitcount(String pageNo, String searchText, Model model, HttpSession session) {
		log.info("BoardController - sortByHitcount실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		// 문자열로 받은 pageNo를 정수로 변환
		Pager pager;
		List<Board> boardList;
	    // 검색 내용 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getTotalRow();
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			// 조회수가 많은 순으로 정렬
			boardList = boardService.getHitcount(pager);
		} else {
			// 검색 내용이 있을 경우 실행되는 정렬
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getRowBySearchText(searchText);
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			pager.setSearchText(searchText);
			// 검색 내용에 맞는 게시글 중 조회수가 많은 순으로 정렬
			boardList = boardService.getHitcountByTitle(pager);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "board/boardListAjaxByHitcount";
	}
	
	// 이경환
	// 좋아요 수에 따른 정렬
	@GetMapping(value ="/sortByLike", produces = "application/json; charset=UTF-8")
	public String sortByLike(String pageNo, String searchText, Model model, HttpSession session) {
		log.info("BoardController - sortByLike실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		// 문자열로 받은 pageNo를 정수로 변환
		Pager pager;
		List<Board> boardList;
	    // 검색 내용이 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getTotalRow();
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			//
			boardList = boardService.getLike(pager);
		} else {
			// 검색 내용이 있을 경우 실행되는 정렬
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getRowBySearchText(searchText);
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			// 검색 내용에 맞는 게시글 중 좋아요 수가 많은 순으로 정렬
			pager.setSearchText(searchText);
			boardList = boardService.getLikeByTitle(pager);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "board/boardListAjaxByLike";
	}
	
	// 이경환
	// 댓글 수에 따른 정렬
	@GetMapping(value ="/sortByComment", produces = "application/json; charset=UTF-8")
	public String sortByComment(String pageNo, String searchText, Model model, HttpSession session) {
		log.info("BoardController - sortByComment실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		// 세션에 pageNo 변환
		session.setAttribute("pageNo", pageNo);
		// 문자열로 받은 pageNo를 정수로 변환
		Pager pager;
		List<Board> boardList;
	    // 검색 내용이 없을 경우 실행되는 정렬
		if(searchText == null || searchText.equals(" ") || searchText.isEmpty()) {
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getTotalRow();
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			// 댓글 수가 많은 순으로 정렬
			boardList = boardService.getComment(pager);
		} else {
			// 검색 내용이 있을 경우 실행되는 정렬
			int intPageNo = Integer.parseInt(pageNo);
			int rowsPagingTarget = boardService.getRowBySearchText(searchText);
			pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
			// 검색 내용이 있는 게시글 중 댓글 수가 많은 순으로 정렬
			pager.setSearchText(searchText);
			boardList = boardService.getCommentByTitle(pager);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "board/boardListAjaxByLike";
	}
	
	// 이경환
	// 제목으로 검색시 정렬
	@GetMapping(value ="/searchTitle", produces = "application/json; charset=UTF-8")
	public String searchTitle(String pageNo, String searchText, Model model, HttpSession session) {
		log.info("BoardController - searchTitle실행");
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
		int rowsPagingTarget = boardService.getRowBySearchText(searchText);
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		List<Board> boardList;
		pager.setSearchText(searchText);
		// 검색의 제목과 내용에 맞는 값을 찾아옴
		boardList = boardService.getSearchTitle(pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "board/boardListAjaxByTitle";
	}
	
	// 이경환
	// Board 수정 버튼 클릭시 연결하는 컨트롤러
	@GetMapping("/updateRegister")
	public String updateRegisterGet(Board board, Model model) {
		log.info("BoardController - updateRegister(Get)실행");
		// boId 초기화
		board.setBoId(board.getBoId());
		// 게시판을 수정하기 위해서 서버에서 값 받아옴
		Board boardSaved = boardService.getBoardByboId(board);
		model.addAttribute("board", boardSaved);
		return "board/boardUpdateRegister";
	}
	
	// 이경환
	// Board 수정시 업데이트를 위한 컨트롤러
	@PostMapping("/updateRegister")
	public String updateRegisterPost(Board board) {
		log.info("BoardController - updateRegister(Post)실행");
		// 기존의 값 DB에서 받아옴
		Board boardSaved = boardService.getBoardByboId(board);
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
		// 변경된 내용들 넣어줌
		boardSaved.setBoTitle(board.getBoTitle());
		boardSaved.setBoContent(board.getBoContent());
		boardSaved.setBoUpdateCheck(board.getBoUpdateCheck());
		boardSaved.setBoAttachdata(board.getBoAttachdata());
		boardService.updateBoard(boardSaved);
		return "redirect:/board/boardDetail?boId="+board.getBoId();
	}
	
}