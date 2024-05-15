package com.mycompany.codebrew.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dto.Account;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CodebrewUserDetailsService implements UserDetailsService {
	@Autowired
	private AccountDao accountDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("실행");
		Account account = accountDao.selectByAcId(username);
		if(account == null) {
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(account.getAcRole()));
		
		UserDetails userDetails = new CodebrewUserDetails(account, authorities);
		
		return userDetails;
	}
}
