package com.mycompany.codebrew.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.MyInfoChangeValidator;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.security.CodebrewUserDetails;
import com.mycompany.codebrew.service.MyPageService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	
	//MyPageService myPageService; 로 주입할 수 있도록 service단 수정해야함

/*    @Autowired
    private MyInfoChangeValidator myInfoChangeValidator ; // 새로운 Validator 주입
*/    
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
	
/*	@InitBinder("account") // "account" 모델 객체에 대한 Validator 바인딩
    public void myInfoValidator(WebDataBinder binder) {
        binder.addValidators(myInfoChangeValidator);
        log.info("유효성검사실행");
    }*/
	
	@PostMapping("/myInfoChange")
	public String myInfoChange(@Validated Account account, Authentication authentication, Errors errors, Model model) {
		log.info("1 수정할 값 전달하기" + account);
		
	    // input으로 들어온 값을 변수에 저장
	    String acName = account.getAcName();
	    String acEmail = account.getAcEmail();
	    String acTel = account.getAcTel();
	    String acPassword = account.getAcPassword();
	    String acPasswordCheck = account.getAcPasswordCheck();
	    CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
	    
	    //유효성 검사 진행 시 에러가 존재할 경우 error에 저장하고 myInfo.jsp로 이동
	    if(errors.hasErrors()) {  
			model.addAttribute("errors", errors);
	    	return "mypage/myInfo";
		}
	    
	    //받아온 값으로 계정의 정보를 업데이트 해주는 코드(전달)
	    Account ac = new Account();
	    ac.setAcId(codebrewUserDetails.getAcId());
	    ac.setAcName(acName);
	    ac.setAcEmail(acEmail);
	    ac.setAcTel(acTel);
	    ac.setAcPassword(acPassword);
	    ac.setAcPasswordCheck(acPasswordCheck);
	    ac.setAcRole(codebrewUserDetails.getAcRole());
	    log.info("2 account에 저장 : " + ac);
	    
	    myPageService.ChangeAccount(ac);
	    log.info("3 account로 계정정보 업데이트 실행");
		
		// ----------------------------------------
	    
		// 업데이트한 계정의 정보를 불러오는 코드(받아오기)
	    String acId = codebrewUserDetails.getAcId();
	    Account accountChanged = myPageService.getAccount(acId);
	    log.info("4 수정된 값 불러오기" + accountChanged);
		// 업데이트 된 계정의 정보를 모델을 통해 저장해주는 코드
		model.addAttribute("accountChanged", accountChanged);
		// 업데이트 된 정보를 에이젝스로 보여줌
		return "mypage/myInfoAjax";
	}

	
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
	@PostMapping(value ="/myWriteBoardCommentHistory", produces = "application/json; charset=UTF-8")
	public String myWriteBoardCommentHistory(String pageNo, Model model, HttpSession session, Authentication authentication) {
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetail.getAccount();
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
		int rowsPagingTarget = myPageService.getBoardCommentTotalRow(account.getAcId());
		log.info("" + rowsPagingTarget);
		Pager pager = new Pager(3, 3, rowsPagingTarget, intPageNo);
		
		// springSecurity에서 acId값 받아서 pager에 넣어줌 xml에서 사용 위해서(나중에 map으로 변경예정)
		pager.setAcId(account.getAcId());
		List<BoardComment> boardCommentList = myPageService.getMyBoardComment(pager);
		
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("pager", pager);

		
		return "mypage/myWriteBoardCommentHistory";
	}
		
	
}
