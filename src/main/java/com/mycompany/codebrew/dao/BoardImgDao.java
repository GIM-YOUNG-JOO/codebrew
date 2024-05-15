package com.mycompany.codebrew.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.BoardImg;

@Mapper
public interface BoardImgDao {
	public int insert(BoardImg boardImg);
}
