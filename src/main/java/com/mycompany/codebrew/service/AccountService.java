package com.mycompany.codebrew.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
	// 전화번호로 아이디 찾기
    public String findAccountIdByTel(String acName, String acTel) {
        // 매개변수를 Map으로 변환하여 전달
        Map<String, Object> params = new HashMap<>();
        params.put("acName", acName);
        params.put("acTel", acTel);
        // DAO를 통해 아이디 조회 후 리턴
        return accountDao.selectAcIdByAcTel(params);
    }

	public Account getAccount(String acId) {
		Account account = accountDao.selectByAcId(acId);
		return account;
	}
	
	//로그인 계정 일치 체크
	/*public Account getAcIdAndAcPassword(Account account) {
		Account accountCheck = accountDao.selectAcIdAndAcPassword(account);
			return accountCheck;
	}*/
	
	public Account findAccountPwByIdAndTelAndEmail(Account account) {
		
		// 여러개의 매개변수 전달을 위해 Map으로 변환
//		Map<String, Object> params = new HashMap<>();
//		params.put("acId", acId);
//		params.put("acName", acName);
//		params.put("acEmail", acEmail);
		
		// 변환된 Map을 파라미터로 전달
		Account accountSaved = accountDao.selectByAcIdAndAcNameAndAcEmail(account);
		return accountSaved;
	}

	public void updatePassword(Account account) {
		// 비밀번호를 암호화해서 저장
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		account.setAcPassword(passwordEncoder.encode(account.getAcPassword()));	
		
		accountDao.updatePassword(account);
	}
    
}
