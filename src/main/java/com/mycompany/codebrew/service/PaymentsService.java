package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.PaymentsDao;
import com.mycompany.codebrew.dto.CartProductDetailProduct;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentsService {
	@Autowired
	private PaymentsDao paymentsDao;

	public List<CartProductDetailProduct> getCartList(String acId) {
		return paymentsDao.selectCartList(acId);
	}
	
}
