package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.ProductDao;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	@Autowired
	private ProductDao productDao;
	
	public void registComplete(Product product) {
		//Business Logic
		int rowNum = productDao.insert(product);
		log.info("rowNum: " + rowNum + ", prid: " + product.getPrId());
	}
	
	public List<Product> getProductList(Pager pager) {
		return productDao.selectByPage(pager);
	}
	
	public int getTotalRows() {
		int totalRows = productDao.count();
		return totalRows;
	}
}
