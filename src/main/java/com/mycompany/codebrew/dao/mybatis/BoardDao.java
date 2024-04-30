package com.mycompany.codebrew.dao.mybatis;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Board;

@Mapper
public interface BoardDao {
	public int insert(Board board);
	// 리턴 값은 void가 아니고 int로 변경하는 게 좋음
}
