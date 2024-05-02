package com.mycompany.codebrew.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.codebrew.dto.Account;

public class Ch17UserDetails extends User {
	private Account member;
	
	public Ch17UserDetails(Account member, List<GrantedAuthority> authorities) {
		super(member.getAcId(), member.getAcPassword(), true, true, true, true, authorities);
		this.member = member;
	}

	public Account getMember() {
		return member;
	}

	public void setMember(Account member) {
		this.member = member;
	}
	
}
