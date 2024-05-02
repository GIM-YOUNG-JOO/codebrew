package com.mycompany.codebrew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.AccountDao;
import com.mycompany.codebrew.dto.Account;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class JoinNowService {
	@Autowired
	private AccountDao accountDao;
	
	public void joinNow(Account account) {
		//Business Logic
		int rowNum = accountDao.insert(account);
		log.info("rowNum: " + rowNum + ", prid: " + account.getAcId());
	}
}
