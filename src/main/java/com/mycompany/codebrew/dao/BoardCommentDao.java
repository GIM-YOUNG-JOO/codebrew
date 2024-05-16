package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.BocLike;

@Mapper
public interface BoardCommentDao {
	public int insert(BoardComment boardComment);
	
	public List<BoardComment> selectCommentList(int boId);

	public int insertComment(BoardComment formData);

	public int insertCommentLike(BocLike bocLike);

	public BocLike selectBoardCommentLike(BocLike bocLike);

	public int insertBoardCommentLike(BocLike bocLike);

	public int updateCommentLikeUp(int bocId);

	public int updateCommentLikeState(BocLike bocLike);

	public int updateCommentLikeDown(int bocId);

	public int updateCommentdoubleLikeUp(int bocId);

	public int updateCommentdoubleLikeDown(int bocId);

	public int deleteBoardCommentByBocId(int bocId);

	
}
