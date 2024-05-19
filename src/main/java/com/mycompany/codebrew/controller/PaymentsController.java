package com.mycompany.codebrew.controller;

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
	
	//결제창 출력
	@GetMapping("")
	public String payments(Authentication authentication, Model model) {
		log.info("PaymentsController - payments실행");
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetail.getAccount();
		String acId = account.getAcId();
		List<CartProductDetailProduct> cartList = service.getCartList(acId);
		for (CartProductDetailProduct cpdp : cartList) {
			byte[] imageData = cpdp.getPrImgData();
			if (imageData != null) {
				cpdp.setPrImageOut(Base64.getEncoder().encodeToString(imageData));
			}
		}
		model.addAttribute("cartList", cartList);
		return "payments/payments";
	}
	
	//결제 완료
	@PostMapping("/paymentsComplete")
	public String paymentsComplete(Authentication authentication, Payment payment) {
		log.info("PaymentsController - paymentsComplete실행");
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetail.getAccount();
		String acId = account.getAcId();
		payment.setAcId(acId);
		service.paymentComplete(payment);
		return "redirect:/";
	}
}
