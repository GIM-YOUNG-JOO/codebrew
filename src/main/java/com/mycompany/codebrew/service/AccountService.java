package com.mycompany.codebrew.service;

import java.util.HashMap;
import java.util.Map;

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
	
    public String findAccountIdByTel(String acName, String acTel) {
        // 매개변수를 Map으로 변환하여 전달
        Map<String, Object> params = new HashMap<>();
        params.put("acName", acName);
        params.put("acTel", acTel);
        // DAO를 통해 아이디 조회 후 리턴
        return accountDao.selectAcIdByAcTel(params);
    }
}
