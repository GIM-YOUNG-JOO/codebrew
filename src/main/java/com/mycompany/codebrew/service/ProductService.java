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
public class ProductService {
	@Autowired
	ProductDao productDao;
	
	public Product getProductByPrId(int prId) {
		Product product = productDao.selectByPrId(prId);
		return product;
	}
	
	public List<Product> getProductList(Pager pager){
		List<Product> productList = productDao.selectByPage(pager);
		return productList;
	}
	public int getTotalRow() {
	      int totalRows = productDao.count();
	      return totalRows;
	   }

	
}
