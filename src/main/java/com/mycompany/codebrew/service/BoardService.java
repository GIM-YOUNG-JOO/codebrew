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
	
	public List<Board> getDate() {
		List<Board> sortedDateList = boardDao.selectByDate();
		
		return sortedDateList;
	}
	
	public List<Board> getDateByTitle(String searchText) {
		List<Board> sortedDateList = boardDao.selectByDateWithTitle(searchText);
		return sortedDateList;
	}
	
	public List<Board> getHitcount() {
		List<Board> sortedHitcountList = boardDao.selectByHitcount();
		
		return sortedHitcountList;
	}
	
	public List<Board> getHitcountByTitle(String searchText) {
		List<Board> sortedHitcountList = boardDao.selectByHitcountWithTitle(searchText);
		
		return sortedHitcountList;
	}

	public List<Board> getLike() {
		List<Board> sortedLikeList = boardDao.selectByLike();
		
		return sortedLikeList;
	}
	public List<Board> getLikeByTitle(String searchText) {
		List<Board> sortedLikeList = boardDao.selectByLikeWithTitle(searchText);
		
		return sortedLikeList;
	}

	public List<Board> getSearchTitle(String searchText) {
		List<Board> searchTitleList = boardDao.selectByTitle(searchText);
		return searchTitleList;
	}

	
}
