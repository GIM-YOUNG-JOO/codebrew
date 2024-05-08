package com.mycompany.codebrew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dto.Account;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AccountService {
	@Autowired
	private AccountDao accountDao;

	public void updateAccount(Account account) {
		accountDao.update(account);
	}
	
}
