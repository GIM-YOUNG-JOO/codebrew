package com.mycompany.codebrew.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.codebrew.dao.AccountDao;
import com.mycompany.codebrew.dao.BoardCommentDao;
import com.mycompany.codebrew.dao.BoardDao;

import com.mycompany.codebrew.dto.BoLike;

import com.mycompany.codebrew.dto.Account;

import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.BocLike;
import com.mycompany.codebrew.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Resource
	BoardDao boardDao;
	
	@Resource
	BoardCommentDao boardCommentDao;
	
	@Resource
	AccountDao accountDao;
	
	// 게시판 인서트하는 서비스
	public void writeBoard(Board board) {
		int rowNum = boardDao.insert(board);
		log.info("rowNum: " + rowNum + ", bno: " + board.getBoId());
	}
	
	public int getTotalRow() {
		// 전체 갯수를 받아옴
		int totalRows = boardDao.count();
		return totalRows;
	}
	
	// 전체 게시글을 받아옴
	public List<Board> getBoardList(Pager pager) {
		List<Board> boardList = boardDao.selectByPage(pager);
		return boardList;
	}
	
	// 최신순 정렬
	public List<Board> getDate(Pager pager) {
		List<Board> sortedDateList = boardDao.selectByDate(pager);
		return sortedDateList;
	}
	
	// 검색 및 최신순
	public List<Board> getDateByTitle(Pager pager) {
		List<Board> sortedDateList = boardDao.selectByDateWithTitle(pager);
		return sortedDateList;
	}
	
	// 조회순 정렬
	public List<Board> getHitcount(Pager pager) {
		List<Board> sortedHitcountList = boardDao.selectByHitcount(pager);
		return sortedHitcountList;
	}
	
	// 검색 및 정렬 순
	public List<Board> getHitcountByTitle(Pager pager) {
		List<Board> sortedHitcountList = boardDao.selectByHitcountWithTitle(pager);
		
		return sortedHitcountList;
	}

	// 좋아요 순
	public List<Board> getLike(Pager pager) {
		List<Board> sortedLikeList = boardDao.selectByLike(pager);
		
		return sortedLikeList;
	}
	
	// 검색 및 좋아요 순
	public List<Board> getLikeByTitle(Pager pager) {
		List<Board> sortedLikeList = boardDao.selectByLikeWithTitle(pager);
		
		return sortedLikeList;
	}
	
	// 댓글 순
	public List<Board> getComment(Pager pager) {
		List<Board> sortedCommentList = boardDao.selectByComment(pager);
		
		return sortedCommentList;
	}
	// 검색 및 댓글 순
	public List<Board> getCommentByTitle(Pager pager) {
		List<Board> sortedCommentList = boardDao.selectByCommentWithTitle(pager);
		
		return sortedCommentList;
	}
	
	// 검색으로 찾아온 값
	public List<Board> getSearchTitle(Pager pager) {
		List<Board> searchTitleList = boardDao.selectByTitle(pager);
		return searchTitleList;
	}
	//정태환
	public Board getBoard(int boId) {
		int hitCount = boardDao.updateHitCount(boId);
		return boardDao.selectBoardByNum(boId);
	}
	//정태환
	public List<BoardComment> getCommentList(int boId) {
		return boardCommentDao.selectCommentList(boId);
	}

	//정태환
	public void writeBoardComment(BoardComment formData) {
		//매개변수boardComment를 DB에 insert해주는 코드
		int result = boardCommentDao.insertComment(formData);
		//insertComment가 정상적으로 실행되었다면 해당 boId의 댓글 수를 증가시켜주는 코드
		if(result != 0) {
			boardDao.updateBoardCommentIncrease(formData.getBoId());
		}
	}
	//정태환
	public BoLike getBoardLike(BoLike boLike) {
		BoLike db = boardDao.selectBoardLike(boLike);
		if(db == null) {
			int result = boardDao.insertBoardLike(boLike);
		}
		return boardDao.selectBoardLike(boLike);
	}
	public BocLike getBoardCommentLike(BocLike bocLike) {
		BocLike db = boardCommentDao.selectBoardCommentLike(bocLike);
		if(db == null) {
			int result = boardCommentDao.insertBoardCommentLike(bocLike);
		}
		return boardCommentDao.selectBoardCommentLike(bocLike);
		
	}

	public void getIncreaseLike(BoLike boLike) {
		int result1 = boardDao.updateLikeUp(boLike.getBoId());
		int result2 = boardDao.updateLikeState(boLike);
	}
	public void getIncreaseCommentLike(BocLike bocLike) {
		int result1 = boardCommentDao.updateCommentLikeUp(bocLike.getBocId());
		int result2 = boardCommentDao.updateCommentLikeState(bocLike);
		
	}

	public void getDecreaseLike(BoLike boLike) {
		int result1 = boardDao.updateLikeDown(boLike.getBoId());
		int result2 = boardDao.updateLikeState(boLike);
	}
	
	public void getDecreaseCommentLike(BocLike bocLike) {
		int result1 = boardCommentDao.updateCommentLikeDown(bocLike.getBocId());
		int result2 = boardCommentDao.updateCommentLikeState(bocLike);
		
	}
	
	

	public void restoreBoardLike(BoLike boLike) {
		if(boLike.getBolState() == 1) {
			int result1 = boardDao.updateLikeDown(boLike.getBoId());
			boLike.setBolState(0);
			int result2 = boardDao.updateLikeState(boLike);
		}else if(boLike.getBolState() == -1) {
			int result1 = boardDao.updateLikeUp(boLike.getBoId());
			boLike.setBolState(0);
			int result2 = boardDao.updateLikeState(boLike);
		}
		
	}
	public void restoreBoardCommentLike(BocLike bocLike) {
		if(bocLike.getBoclState() == 1) {
			int result1 = boardCommentDao.updateCommentLikeDown(bocLike.getBocId());
			bocLike.setBoclState(0);
			int result2 = boardCommentDao.updateCommentLikeState(bocLike);
		}else if(bocLike.getBoclState() == -1) {
			int result1 = boardCommentDao.updateCommentLikeUp(bocLike.getBocId());
			bocLike.setBoclState(0);
			int result2 = boardCommentDao.updateCommentLikeState(bocLike);
		}
		
	}

	public void getDoubleIncreaseLike(BoLike boLike) {
		//상태변경
		int result1 = boardDao.updateLikeState(boLike);
		//좋아요  값 수정
		int result2 = boardDao.updatedoubleLikeUp(boLike.getBoId());
	}
	public void getDoubleIncreaseCommnetLike(BocLike bocLike) {
		//상태변경
		int result1 = boardCommentDao.updateCommentLikeState(bocLike);
		//좋아요  값 수정
		int result2 = boardCommentDao.updateCommentdoubleLikeUp(bocLike.getBocId());
		
	}

	public void getDoubleDecreaseLike(BoLike boLike) {
		//상태변경
		int result1 = boardDao.updateLikeState(boLike);
		//좋아요 값 수정
		int result2 = boardDao.updatedoubleLikeDown(boLike.getBoId());
	}
	
	public void getDoubleDecreaseCommentLike(BocLike bocLike) {
		//상태변경
		int result1 = boardCommentDao.updateCommentLikeState(bocLike);
		//좋아요 값 수정
		int result2 = boardCommentDao.updateCommentdoubleLikeDown(bocLike.getBocId());
		
	}

	// 유저의 권한을 받아옴
	public Account getAccountRole(String acId) {
		return accountDao.selectByAcId(acId);
	}
	
	// 게시판의 게시물 번호를 받아옴
	public Board getBoardByboId(Board board) {
		Board boardSaved = boardDao.selectBoardByNum(board.getBoId());
		return boardSaved;
	}


	public void boardDelete(int boId) {
		int result = boardDao.deleteBoardByBoId(boId);
		
	}

	public void deleteComment(int bocId,int boId) {
		int result = boardCommentDao.deleteBoardCommentByBocId(bocId);
		boardDao.updateBoardCommentDecrease(boId);
	}
	
	// 게시글 수정시 사진을 업데이트하는지
	public void updateBoard(Board board) {
		// boUpdateCheck가 1일 경우 수정시 사진이 변경됨
		log.info("boattachdata1: " + board.getBoAttachdata());
		
		Board boardSaved;
		// 사진이 변경되었을 시 1
		if(board.getBoUpdateCheck() == 1) {
			boardDao.updateBoardWithOne(board);
			log.info("boattachdata2: " + board.getBoAttachdata());
			// boUpdateCheck가 -1일 경우 사진이 삭제되어 DB에 사진 저장 X
		} else if(board.getBoUpdateCheck() == -1 ) {
			boardDao.updateBoardWithMinusOne(board);
			// boUpdateCheck가 0일 경우 기존에 사진 그대로 저장
		} else {
			boardDao.updateBoardWithZero(board);
			
		}

		
	}
	
	// 검색 기능시 찾아온 게시글의 수를 리턴
	public int getRowBySearchText(String searchText) {
		int totalRows = boardDao.countBySearchText(searchText);
		return totalRows;
		
	}

	
}
