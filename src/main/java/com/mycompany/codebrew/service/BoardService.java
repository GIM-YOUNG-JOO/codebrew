package com.mycompany.codebrew.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.mybatis.BoardDao;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Resource
	BoardDao boardDao;
	
	public void writeBoard(Board board) {
		int rowNum = boardDao.insert(board);
		log.info("rowNum: " + rowNum + ", bno: " + board.getBoId());
	}
	
	public int getTotlaRow() {
		// 전체 갯수를 받아옴
		int totalRows = boardDao.count();
		return totalRows;
	}

	public List<Board> getBoardList(Pager pager) {
		List<Board> boardList = boardDao.selectByPage(pager);
		return boardList;
	}
	
	public List<Board> getDate() {
		List<Board> dateList = boardDao.selectByDate();
		
		return dateList;
	}

	
	
}
