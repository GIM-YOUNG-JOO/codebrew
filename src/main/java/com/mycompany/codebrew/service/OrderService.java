package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.OrderDao;
import com.mycompany.codebrew.dao.ProductDao;
import com.mycompany.codebrew.dto.Cart;
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
	public void registProductDetail(ProductDetail productDetail) {
		int rowNum = productDao.insertProductDetail(productDetail);
		log.info("rowNum: " + rowNum + ", prid: " + productDetail.getPrId());
	}
	public Product getCoffee(int prId) {
		return orderDao.selectCoffeeByPrId(prId);
	}
	public void registCart(Cart cart) {
		orderDao.insertCart(cart);
		
	}
	
}
