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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Payment;
import com.mycompany.codebrew.security.CodebrewUserDetails;
import com.mycompany.codebrew.service.MyPageService;
import com.mycompany.codebrew.service.PaymentsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	private PaymentsService payService;

	
	
	//MyPageService myPageService; 로 주입할 수 있도록 service단 수정해야함

/*    @Autowired
    private MyInfoChangeValidator myInfoChangeValidator ; // 새로운 Validator 주입
*/    
	
	@Secured("ROLE_USER")
	@GetMapping("/myInfo")
	public String myInfoDetail(Authentication authentication, Model model) {
		log.info("MyPageController - myInfoDetail실행");
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
		log.info("MyPageController - myInfoChange실행");
		
	    // input으로 들어온 값을 변수에 저장
	    String acName = account.getAcName();
	    String acEmail = account.getAcEmail();
	    String acTel = account.getAcTel();
	    String acPassword = account.getAcPassword();
	    String acPasswordCheck = account.getAcPasswordCheck();
	    // input으로 들어오지않는 Id 값은 로그인 시 security를 통해 저장되는 값을 Authentication 객체로 불러오기
	    CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
	    //유효성 검사 진행 시 에러가 존재할 경우 error에 저장하고 myInfo.jsp로 이동
	    /*if(errors.hasErrors()) {  
			model.addAttribute("errors", errors);
	    	return "mypage/myInfo";
		}*/
	    
	    //받아온 값으로 계정의 정보를 업데이트 해주는 코드(전달)
	    Account ac = new Account();
	    ac.setAcId(codebrewUserDetails.getAcId());
	    ac.setAcName(acName);
	    ac.setAcEmail(acEmail);
	    ac.setAcTel(acTel);
	    ac.setAcPassword(acPassword);
	    ac.setAcPasswordCheck(acPasswordCheck);
	    ac.setAcRole(codebrewUserDetails.getAcRole());
	    myPageService.ChangeAccount(ac); 
	    
		// 업데이트한 계정의 정보를 불러오는 코드(받아오기)
	    String acId = codebrewUserDetails.getAcId();
	    Account accountChanged = myPageService.getAccount(acId);
		// 업데이트 된 계정의 정보를 모델을 통해 저장해주는 코드
		model.addAttribute("accountChanged", accountChanged);
		// 업데이트 된 정보를 에이젝스로 보여줌
		return "mypage/myInfoAjax";
	}
	
	// 이경환
	@GetMapping(value ="/myWriteBoardHistory", produces = "application/json; charset=UTF-8")
	public String myWriteBoardHistory(String pageNo, Model model, HttpSession session, Authentication authentication) {
		log.info("MyPageController - myWriteBoardHistory(Get)실행");
		CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
		String acId = codebrewUserDetails.getAccount().getAcId();
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
		int rowsPagingTarget = myPageService.getBoardTotalRow(acId);
		Pager pager = new Pager(3, 3, rowsPagingTarget, intPageNo);
		// springSecurity에서 acId값 받아서 pager에 넣어줌 xml에서 사용 위해서(나중에 map으로 변경예정)
		pager.setAcId(acId);
		List<Board> boardList = myPageService.getMyBoard(pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		return "mypage/myWriteBoardHistory";
	}
	
	//정태환
	@PostMapping(value ="/myWriteBoardCommentHistory", produces = "application/json; charset=UTF-8")
	public String myWriteBoardCommentHistory(String pageNo, Model model, HttpSession session, Authentication authentication) {
		log.info("MyPageController - myWriteBoardHistory(Post)실행");
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
		Pager pager = new Pager(3, 3, rowsPagingTarget, intPageNo);
		// springSecurity에서 acId값 받아서 pager에 넣어줌 xml에서 사용 위해서(나중에 map으로 변경예정)
		pager.setAcId(account.getAcId());
		List<BoardComment> boardCommentList = myPageService.getMyBoardComment(pager);
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("pager", pager);
		return "mypage/myWriteBoardCommentHistory";
	}
	
	
	//결제 내역 출력
	@GetMapping(value ="/myPayment" , produces = "application/json; charset=UTF-8")
	public String myPayment(Principal principal, Model model) {
		log.info("개인정보 실행");
		List<Payment> paymentList = payService.getPaymentsListByAcId(principal.getName());
		model.addAttribute("paymentList", paymentList);
		return "mypage/myPayment";
	}
	
	// 개인 정보 재 출력
		@GetMapping(value ="/myAccount" , produces = "application/json; charset=UTF-8")
		public String myAccount(Authentication authentication, Model model) {
			CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
			Account account = codebrewUserDetails.getAccount();
			model.addAttribute("account", account);
			return "mypage/myAccount";
		}
	
}