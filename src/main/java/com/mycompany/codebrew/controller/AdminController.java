package com.mycompany.codebrew.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Account;
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
			pageNo = (String) session.getAttribute("productPageNo");
			//세션에 저장되어있지 않다면 1로 세팅
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("productPageNo", pageNo);
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		
		int rowsPagingTarget = service.getTotalRows("product");
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		List<Product> productList = service.getProductList(pager);
		for (Product product : productList) {
            byte[] imageData = product.getPrImgData();
            if(imageData != null)
            {
                String img = Base64.getEncoder().encodeToString(imageData);
                product.setPrImageOut(img);
            }
        }
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
	
	@GetMapping("/productEdit")
	public String productEdit(int prId, Model model) {
		log.info("상품 수정  실행");
		Product product = service.getProduct(prId);
		model.addAttribute("product", product);
		return "admin/productEdit";
	}
	
	@PostMapping("/productUpdate")
	public String productUpdate(Product product) {
		
		//첨부 파일이 있는지 여부 조사
		if(product.getPrImage() != null && !product.getPrImage().isEmpty()) {
			try {
				product.setPrImgData(product.getPrImage().getBytes());
			} catch (IOException e) {
				
			}
		}
		log.info("수정 로그 : " + product.getPrName());
		//비즈니스 로직 처리를 서비스로 위임
		service.updateProduct(product);
		
		return "redirect:/admin/productList";
	}
	
	@GetMapping("/productDelete")
	public String productDelete(int prId) {
		log.info("상품 삭제 실행");
		service.removeProduct(prId);
		return "redirect:/admin/productList";
	}
	
	@GetMapping("/accountList")
	public String accountList(String pageNo, Model model, HttpSession session) {
		//pageNo를 받지 못했을 경우, 세션에 저장되어있는지 확인
		log.info("계정 목록 실행");
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("accountPageNo");
			//세션에 저장되어있지 않다면 1로 세팅
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("accountPageNo", pageNo);
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		int rowsPagingTarget = service.getTotalRows("account");
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		List<Account> accountList = service.getAccountList(pager);

		model.addAttribute("pager", pager);
		model.addAttribute("accountList", accountList);
		
		return "admin/accountList";
	}
	
	@PostMapping("/accountUpdate")
	public String accountUpdate(Account account) {
		service.updateAccount(account);
		
		return "redirect:/admin/accountList";
	}
	
	@GetMapping("/accountDelete")
	public String accountDelete(String acId) {
		log.info("계정 삭제 실행");
		service.removeAccount(acId);
		return "redirect:/admin/accountList";
	}
	
}
