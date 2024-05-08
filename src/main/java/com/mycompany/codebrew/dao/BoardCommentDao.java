package com.mycompany.codebrew.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.BoardComment;

@Mapper
public interface BoardCommentDao {
	public int insert(BoardComment boardComment);

}
