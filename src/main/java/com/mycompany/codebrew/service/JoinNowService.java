package com.mycompany.codebrew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dto.Account;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class JoinNowService {
	@Autowired
	private AccountDao accountDao;
	
	public void joinNow(Account account) {
		//Business Logic
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		account.setAcPassword(passwordEncoder.encode(account.getAcPassword()));		
		accountDao.insert(account);
		
		log.info("prid: " + account.getAcId());
	}
}
