package com.mycompany.codebrew.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dao.MyPageDao;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.Pager;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;

	@Autowired
	private AccountDao accountDao;
	
	
	public int getBoardTotalRow(String acId) {
		int totalRows = myPageDao.count(acId);
		return totalRows;
	}
	public int getBoardCommentTotalRow(String acId) {
		int totalRows = myPageDao.boardCommentCount(acId);
		return totalRows;
	}

	public List<Board> getMyBoard(Pager pager) {
	
		List<Board> myBoardList = myPageDao.selectMyboard(pager);
		return myBoardList;
	}
	public List<BoardComment> getMyBoardComment(Pager pager) {
		
		List<BoardComment> myBoardCommentList = myPageDao.selectMyboardComment(pager);
		return myBoardCommentList;
	}
	
	// 아이디로 계정정보 불러오기용
	public Account getAccount(String acId) {
		Account account = accountDao.selectByAcId(acId);
			return account;
		}

	public void ChangeAccount(Account account) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		account.setAcPassword(passwordEncoder.encode(account.getAcPassword()));		
		myPageDao.updateAccount(account);
		log.info("myPageService에서 비밀번호 인코딩 후 계정 정보 수정");
	}
}
