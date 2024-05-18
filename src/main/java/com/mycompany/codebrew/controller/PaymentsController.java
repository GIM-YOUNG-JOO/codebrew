package com.mycompany.codebrew.controller;

import java.security.Principal;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Payment;
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
	
	@PostMapping("/paymentsComplete")
	public String paymentsComplete(Principal principal, Payment payment) {
		payment.setAcId(principal.getName());
		service.paymentComplete(payment);
		
		return "redirect:/";
	}
}
