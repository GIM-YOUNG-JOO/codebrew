package com.mycompany.codebrew.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/productList")
	public String productList(String pageNo, Model model, HttpSession session) {
		//pageNo를 받지 못했을 경우, 세션에 저장되어있는지 확인
		log.info("상품 목록 실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			//세션에 저장되어있지 않다면 1로 세팅
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		
		int rowsPagingTarget = service.getTotalRows();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		List<Product> productList = service.getProductList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		
		return "admin/productList";
	}
	
	@GetMapping("/productRegistration")
	public String productRegistration() {
		log.info("상품 등록 실행");
		return "admin/productRegistration";
	}
	
	@PostMapping("/registComplete")
	public String registComplete(Product product) {
		log.info("prId : " + product.getPrId());
		log.info(product.getPrName());
		log.info("pcId : " + product.getPcId());
		log.info("prPrice : " + product.getPrPrice());
		log.info("prInfo : " + product.getPrInfo());
		log.info("prMemo : " + product.getPrMemo());
		if(product.getPrImage() != null && !product.getPrImage().isEmpty()) {
			try {
				product.setPrImgData(product.getPrImage().getBytes());
				log.info("" + product.getPrImgData());
			} catch (IOException e) {
				
			}
		}
		
		service.registComplete(product);
		return "redirect:/admin/productList";
	}
	
	@RequestMapping("/productDelete")
	public String productDelete() {
		log.info("상품 삭제 실행");
		return "admin/productDelete";
	}
}
