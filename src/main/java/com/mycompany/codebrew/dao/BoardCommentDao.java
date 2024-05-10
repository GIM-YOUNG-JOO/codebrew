package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.BoardComment;

@Mapper
public interface BoardCommentDao {
	public int insert(BoardComment boardComment);
	
	public List<BoardComment> selectCommentList(int boId);
}
