package com.mycompany.codebrew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.MyPageDao;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;
	
	public int getBoardTotalRow(String acId) {
		int totalRows = myPageDao.count(acId);
		return totalRows;
	}

	public List<Board> getMyBoard(Pager pager) {
	
		List<Board> myBoardList = myPageDao.selectMyboard(pager);
		return myBoardList;
	}
	
}
