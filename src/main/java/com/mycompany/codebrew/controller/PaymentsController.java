package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payments")
public class PaymentsController {
	@RequestMapping("")
	public String payments() {
		log.info("결제창 실행");
		
		return "payments/payments";
	}
}
