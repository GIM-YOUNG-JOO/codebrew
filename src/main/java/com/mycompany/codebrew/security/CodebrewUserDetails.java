package com.mycompany.codebrew.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.codebrew.dto.Account;

public class CodebrewUserDetails extends User {
	private Account account;
	
	public CodebrewUserDetails(Account account, List<GrantedAuthority> authorities) {
		super(account.getAcId(), account.getAcPassword(), true, true, true, true, authorities);
		this.account = account;
	}
 
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	public String getAcId() {
		return account.getAcId();
	}
	
	public String getAcRole() {
		return account.getAcRole();
	}
}
