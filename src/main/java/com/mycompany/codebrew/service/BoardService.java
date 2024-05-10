package com.mycompany.codebrew.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.BoardCommentDao;
import com.mycompany.codebrew.dao.BoardDao;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Resource
	BoardDao boardDao;
	
	@Resource
	BoardCommentDao boardCommentDao;
	
	public void writeBoard(Board board) {
		int rowNum = boardDao.insert(board);
		log.info("rowNum: " + rowNum + ", bno: " + board.getBoId());
	}
	
	public int getTotalRow() {
		// 전체 갯수를 받아옴
		int totalRows = boardDao.count();
		return totalRows;
	}

	public List<Board> getBoardList(Pager pager) {
		List<Board> boardList = boardDao.selectByPage(pager);
		return boardList;
	}
	
	public List<Board> getDate(Pager pager) {
		List<Board> sortedDateList = boardDao.selectByDate(pager);
		
		return sortedDateList;
	}
	
	public List<Board> getDateByTitle(Pager pager) {
		List<Board> sortedDateList = boardDao.selectByDateWithTitle(pager);
		return sortedDateList;
	}
	
	public List<Board> getHitcount(Pager pager) {
		List<Board> sortedHitcountList = boardDao.selectByHitcount(pager);
		
		return sortedHitcountList;
	}
	
	public List<Board> getHitcountByTitle(Pager pager) {
		List<Board> sortedHitcountList = boardDao.selectByHitcountWithTitle(pager);
		
		return sortedHitcountList;
	}

	public List<Board> getLike(Pager pager) {
		List<Board> sortedLikeList = boardDao.selectByLike(pager);
		
		return sortedLikeList;
	}
	public List<Board> getLikeByTitle(Pager pager) {
		List<Board> sortedLikeList = boardDao.selectByLikeWithTitle(pager);
		
		return sortedLikeList;
	}
	public List<Board> getComment(Pager pager) {
		List<Board> sortedCommentList = boardDao.selectByComment(pager);
		
		return sortedCommentList;
	}
	
	public List<Board> getCommentByTitle(Pager pager) {
		List<Board> sortedCommentList = boardDao.selectByCommentWithTitle(pager);
		
		return sortedCommentList;
	}

	public List<Board> getSearchTitle(Pager pager) {
		List<Board> searchTitleList = boardDao.selectByTitle(pager);
		return searchTitleList;
	}

	public Board getBoard(int boId) {
		return boardDao.selectBoardByNum(boId);
	}

	
}
