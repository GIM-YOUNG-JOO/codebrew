package com.mycompany.codebrew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.ProductDao;
import com.mycompany.codebrew.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductRegistrationService {
	@Autowired
	private ProductDao productDao;
	
	public void RegistComplete(Product product) {
		//Business Logic
		int rowNum = productDao.insert(product);
		log.info("rowNum: " + rowNum + ", prid: " + product.getPrid());
	}
}
