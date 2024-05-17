package com.mycompany.codebrew.controller;

import java.security.Principal;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Payment;
import com.mycompany.codebrew.security.CodebrewUserDetails;
import com.mycompany.codebrew.service.PaymentsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Secured("ROLE_USER")
@RequestMapping("/payments")
public class PaymentsController {
	@Autowired
	private PaymentsService service;
	
	@GetMapping("")
	public String payments(Principal principal, Model model) {
		log.info("결제창 실행");
		
		List<CartProductDetailProduct> cartList = service.getCartList(principal.getName());
		for (CartProductDetailProduct cpdp : cartList) {
			byte[] imageData = cpdp.getPrImgData();
			if (imageData != null) {
				cpdp.setPrImageOut(Base64.getEncoder().encodeToString(imageData));
			}
		}
		model.addAttribute("cartList", cartList);
		return "payments/payments";
	}
	
	@PostMapping("/paymentWithBranch")
	public String paymentWithBranch(Payment payment, Authentication authentication) {
		
		// 사용자 정보 Security에서 얻기
		CodebrewUserDetails codebrewUserDetails = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetails.getAccount();
		log.info("로그인한 accout 정보: " + account);
		log.info("payment 내용: " + payment);
		/*Payment paymentSaved = service.getAcId(account.getAcId());*/
		
		
		
		return null;
	}
	
}
