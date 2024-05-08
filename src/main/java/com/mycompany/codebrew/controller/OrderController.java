package com.mycompany.codebrew.controller;



import java.security.Principal;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.codebrew.dto.Product;
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
	public String cart(Principal principal) {
		log.info(principal.getName());
		return "order/cart";
	}
	@RequestMapping("/detailPage")
	public String detailPage() {
		log.info("실행");
		return "order/detailPage";
	}
}
