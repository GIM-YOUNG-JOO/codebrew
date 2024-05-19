package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dao.DashboardDao;
import com.mycompany.codebrew.dao.ProductDao;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Dashboard;
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
	@Autowired
	private DashboardDao dashboardDao;
	
	public void registComplete(Product product) {
		//Business Logic
		int rowNum = productDao.insert(product);
		log.info("rowNum: " + rowNum + ", prid: " + product.getPrId());
	}
	
	public List<Product> getProductList(Pager pager) {
		return productDao.selectByPage(pager);
	}
	
	public int getTotalRows(String str) {
		int totalRows = 0;
		if(str.equals("product"))
			totalRows = productDao.count();
		else if(str.equals("account"))
			totalRows = accountDao.count();
		return totalRows;
	}

	public Product getProduct(int prId) {
		Product product = productDao.selectByPrId(prId);
		return product;
	}
	
	public void updateProduct(Product product) {
		log.info("서비스로 넘어옴 : " + product.getPrName(), product.getPrImgData());
		productDao.update(product);
	}

	public void removeProduct(int prId) {
		productDao.deleteByPrId(prId);
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

	public void removeAccount(String acId) {
		accountDao.deleteByAcId(acId);
	}

	//대시보드 출력 서비스 -김영주
	public Dashboard getDashboardInfo() {
		Dashboard dashboard = new Dashboard();
		dashboard.setUserCount(dashboardDao.countUser());
		dashboard.setMenuCount(dashboardDao.countMenu());
		dashboard.setTotalSalesCount(dashboardDao.totalSalesCount()); // 결제 기능 완료 후 dashboardDao.totalSalesCount()
		dashboard.setTotalSalesRevenue(dashboardDao.totalSalesRevenue()); // dashboardDao.totalSalesRevenue()
		return dashboard;
	}
}
