package com.mycompany.codebrew.controller;



import java.security.Principal;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;
import com.mycompany.codebrew.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService service;

	@GetMapping("/menu")
	public String menu(Model model) {
		//pageNo를 받지 못했을 경우, 세션에 저장되어있는지 확인
		log.info("상품 목록 실행");

		List<Product> coffeeList = service.getCoffeeList();
		for (Product coffee : coffeeList) {
            byte[] imageData = coffee.getPrImgData();
            if(imageData != null)
            {
                String img = Base64.getEncoder().encodeToString(imageData);
                coffee.setPrImageOut(img);
            }
        }
		model.addAttribute("coffee", coffeeList);
		
		return "order/menu";
	}
	
	@GetMapping("/cart")
	public String cart(Principal principal, Model model) {
		log.info(principal.getName());
		//유저의 아이디로 만들어진 모든 카트를 가져오기
		
		return "order/cart";
	}
	@GetMapping("/detailPage")
	public String detailPage(Model model, int prId) {
		log.info("detailPage실행");
		Product coffee = service.getCoffee(prId);
		byte[] imageData = coffee.getPrImgData();
		if (imageData != null) {
			String img = Base64.getEncoder().encodeToString(imageData);
			coffee.setPrImageOut(img);
		}
		model.addAttribute("coffee", coffee);
		return "order/detailPage";
	}
	@PostMapping("/detailPagePost")
	public String detailPagePost(ProductDetail productDetail, Principal principal) {
		log.info("detailPagePost실행");
		//상품아이디와 원두옵션, 온도옵션, 사이즈옵션, 샷 수량을 받아서  상품디테일 테이블로 넘겨주기
		service.registProductDetail(productDetail);
		//카트테이블에 데이터를 넣어주기
		Cart cart = new Cart();
		cart.setAcId(principal.getName());
		cart.setPdId(productDetail.getPdId());
		service.registCart(cart);
		return "redirect:/order/menu";
	}
}
