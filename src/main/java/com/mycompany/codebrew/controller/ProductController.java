package com.mycompany.codebrew.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/menu")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("")
	public String menuIndex() {
		log.info("실행");
		return "order/menu";
	}
	
	@RequestMapping("/cart")
	public String cart() {
		log.info("실행");
		return "order/cart";
	}
	@RequestMapping("/detailPage")
	public String detailPage() {
		log.info("실행");
		return "order/detailPage";
	}
	@GetMapping("/productList")
	public String boardList(String pageNo, Model model, HttpSession session) {
		if (pageNo == null) {
			// pageNo를 받지 못했을 경우
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}
		// 세션에 PageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 저장
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		int rowsPagingTarget = service.getTotalRow();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		List<Product> productList = service.getProductList(pager);
		log.info("실행" + productList.size());
		log.info("실행" + pager.getEndRowNo());
		log.info("실행" + pager.getStartRowNo());
		// JSP에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		return "admin/productList";
	}
}
