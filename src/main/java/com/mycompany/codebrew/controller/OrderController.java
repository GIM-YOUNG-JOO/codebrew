package com.mycompany.codebrew.controller;



import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;
import com.mycompany.codebrew.security.CodebrewUserDetails;
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
		List<Product> beveridgeList = service.getBeveridgeList();
		List<Product> beanList = service.getBeanList();
		List<Product> merchandiseList = service.getMerchandiseList();
		List<List<Product>> allLists = new ArrayList<>();
		allLists.add(coffeeList);
		allLists.add(beveridgeList);
		allLists.add(beanList);
		allLists.add(merchandiseList);

		for(List<Product> list : allLists) {
			for (Product product : list) {
	            byte[] imageData = product.getPrImgData();
	            if(imageData != null)
	            {
	                String img = Base64.getEncoder().encodeToString(imageData);
	                product.setPrImageOut(img);
	            }
	        }
		}
		model.addAttribute("coffee", coffeeList);
		model.addAttribute("beveridge", beveridgeList);
		model.addAttribute("bean", beanList);
		model.addAttribute("merchandise", merchandiseList);
		
		return "order/menu";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/cart")
	public String cart(Model model,Authentication authentication) {
		CodebrewUserDetails codebrewUserDetail = (CodebrewUserDetails)authentication.getPrincipal();
		Account account = codebrewUserDetail.getAccount();
		log.info("멤버정보 :" + account);
		//일단 유저가 로그인되어 있지 않으면 jsp에서 c:if를 통해서 장바구니 화면을 보여주지 않고 로그인해달라는 페이지로 만들기
		if(account.getAcId() != null) {
		//유저의 아이디로 찾은 모든 카트를 프로덕트디테일, 프로덕트, 템프옵션, 사이즈옵션, 빈즈옵션 조인해서 가져오기(가져오기전에 필요한 컬럼들로만 구성된 DTO하나 만들어주기)
		List<CartProductDetailProduct> cartList = service.getCartList(account.getAcId());
		//모델을 통해 화면에 보여줄 수 있게 저장해주기
		for(CartProductDetailProduct list : cartList) {
			byte[] imageData = list.getPrImgData();
			if (imageData != null) {
				String img = Base64.getEncoder().encodeToString(imageData);
				list.setPrImageOut(img);
			}
		}
		model.addAttribute("cartList", cartList);
		}
		return "order/cart";
	}
	@PostMapping("/updateCartItemQuantity")
	public void cartItemUpdateQuantity(@RequestBody CartProductDetailProduct cartItem) {
		//카트아이템에서 pdId와 pdCount 받아와서 업데이트 쳐주기
		log.info("보내준 카트의 정보 :" + cartItem);
		service.updateCartItemQuantity(cartItem);
	}
	
	@GetMapping("/detailPageGet")
	public String detailPageGet(Model model, int prId) {
		log.info("detailPageGet실행");
		Product coffee = service.getCoffee(prId);
		byte[] imageData = coffee.getPrImgData();
		if (imageData != null) {
			String img = Base64.getEncoder().encodeToString(imageData);
			coffee.setPrImageOut(img);
		}
		model.addAttribute("coffee", coffee);
		return "order/detailPage";
	}
	
	@Secured("ROLE_USER")
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
	
	@Secured("ROLE_USER")
	@GetMapping("/detailPageUpdateGet")
	public String detailPageUpdateGet(Model model, int pdId) {
		log.info("detailPageUpdateGet실행");
		ProductDetail pd = service.getProductDetail(pdId);
		byte[] imageData = pd.getPrImgData();
		if (imageData != null) {
			String img = Base64.getEncoder().encodeToString(imageData);
			pd.setPrImageOut(img);
		}
		model.addAttribute("pd", pd);
		return "order/detailPageUpdate";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/detailPageUpdatePost")
	public String detailPageUpdatePost(ProductDetail productDetail) {
		log.info("detailPageUpdatePost실행");
		//pdid로 데이터를 찾고 productDetail 테이블 수정
		log.info("객체 값" + productDetail);
		service.updateProductDetail(productDetail);
		// 카트테이블에 데이터를 수정해주기 >> 카트의 컬럼값이 변하지 않기 때문에 굳이 할 필요 없음
		/*Cart cart = new Cart();
		cart.setAcId(principal.getName());
		cart.setPdId(productDetail.getPdId());
		service.registCart(cart);*/
		return "redirect:/order/cart";
	}
	
	@ResponseBody
	@Secured("ROLE_USER")
	@PostMapping(value="/cartItemDelete", produces="application/json; charset=UTF-8")
	public void cartItemDelete(@RequestBody Cart formData) {
		log.info("" + formData.getCaId());
		log.info("" + formData.getPdId());
		service.deleteCartItem(formData);
		log.info("cart, productDetail 삭제완료");
	}
}
