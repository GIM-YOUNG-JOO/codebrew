package com.mycompany.codebrew.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.OrderDao;
import com.mycompany.codebrew.dao.ProductDao;
import com.mycompany.codebrew.dto.Cart;
import com.mycompany.codebrew.dto.CartProductDetailProduct;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	
	public List<Product> getCoffeeList() {
		return orderDao.selectByCoffee();
	}
	public List<Product> getBeveridgeList() {
		return orderDao.selectByBeveridge();
	}
	public List<Product> getBeanList() {
		return orderDao.selectByBean();
	}
	public List<Product> getMerchandiseList() {
		return orderDao.selectByMerchandise();
	}
	public boolean registProductDetail(ProductDetail productDetail) {
		ProductDetail result = productDao.selectProductDetail(productDetail);
		log.info("result 결과 1: " +result );
		if(result == null) {
			int rowNum = productDao.insertProductDetail(productDetail);
			log.info("rowNum: " + rowNum + ", prid: " + productDetail.getPrId());
			return true;
			
		}else if(result != null) {
			result.setPdCount(result.getPdCount() + productDetail.getPdCount());
			//프로덕트 다오에서 업데이트 
			log.info("result 결과 2: " + result);
			int num = productDao.updateProductDetail(result);
			return false;
		}
		return true;
	}
	public Product getCoffee(int prId) {
		return orderDao.selectCoffeeByPrId(prId);
	}
	public void registCart(Cart cart) {
		orderDao.insertCart(cart);
		
	}
	public List<CartProductDetailProduct> getCartList(String acId) {
		return orderDao.selectCartList(acId);
	}
	public void updateProductDetail(ProductDetail productDetail) {
		orderDao.updateProductDetail(productDetail);
		
	}
	public void deleteCartItem(Cart formData) {
		orderDao.deleteCart(formData);
		orderDao.deleteProductDetail(formData);
		
	}
	public ProductDetail getProductDetail(int pdId) {
		return orderDao.selectProductDetail(pdId);
	}
	public void updateCartItemQuantity(CartProductDetailProduct cartItem) {
		int result = orderDao.updateQuantityByPdid(cartItem);
		
	}
	
	
	
}
