package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.ProductDao;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;
import com.mycompany.codebrew.dto.ProductDetail;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public void registProductDetail(ProductDetail productDetail) {
		int rowNum = productDao.insertProductDetail(productDetail);
		log.info("rowNum: " + rowNum + ", prid: " + productDetail.getPrId());
	}

}
