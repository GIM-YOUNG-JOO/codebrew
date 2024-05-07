package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.AccountDao;
import com.mycompany.codebrew.dao.mybatis.ProductDao;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private AccountDao accountDao;
	
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

	public Product getProduct(int prId) {
		Product product = productDao.selectByPrId(prId);
		return product;
	}
	
	public void updateProduct(Product product) {
		log.info("서비스로 넘어옴 : " + product.getPrName(), product.getPrId());
		productDao.update(product);
	}

	public void removeProduct(int prId) {
		productDao.deleteByprId(prId);
	}
	
	public List<Account> getAccountList(Pager pager) {
		return accountDao.selectByPage(pager);
	}
	
	public Account getAccount(String acId) {
		Account account = accountDao.selectByAcId(acId);
		return account;
	}

	public void updateAccount(Account account) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		account.setAcPassword(passwordEncoder.encode(account.getAcPassword()));		
		accountDao.update(account);
	}
}
