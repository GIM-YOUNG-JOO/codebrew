package com.mycompany.codebrew.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.BoLike;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.Pager;

@Mapper
public interface BoardDao {
	public int insert(Board board);
	// 리턴 값은 void가 아니고 int로 변경하는 게 좋음
	public int count();

	public List<Board> selectByPage(Pager pager);

	public List<Board> selectByDate(Pager pager);

	public List<Board> selectByHitcount(Pager pager);

	public List<Board> selectByLike(Pager pager);

	public List<Board> selectByTitle(Pager pager);

	public List<Board> selectByDateWithTitle(Pager pager);

	public List<Board> selectByHitcountWithTitle(Pager pager);

	public List<Board> selectByLikeWithTitle(Pager pager);

	public Board selectBoardByNum(int boId);

	public List<Board> selectByComment(Pager pager);

	public List<Board> selectByCommentWithTitle(Pager pager);

	public int updateHitCount(int boId);

	public int insertBoardLike(BoLike boLike);

	public BoLike selectBoardLike(BoLike boLike);

	public int updateLikeUp(int boId);

	public int updateLikeDown(int boId);

	public int updateLikeState(BoLike boLike);

	public int updatedoubleLikeUp(int boId);

	public int updatedoubleLikeDown(int boId);

	public int deleteBoardByBoId(int boId);
	
	public void updateBoardWithOne(Board board);

	public void updateBoardWithMinusOne(Board board);

	public void updateBoardWithZero(Board board);

	public void updateBoardCommentIncrease(int boId);

	public int countBySearchText(String searchText);

	public void updateBoardCommentDecrease(int boId);

}
